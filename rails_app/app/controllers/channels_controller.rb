class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  def index
    sql = """
    select comment_count.id, name, abstract, num_of_comments, num_of_events
    from (
        select channels.id id, channels.name, channels.abstract, count(comments.id) num_of_comments
        from channels left join comments on channels.id=comments.channel_id
        where channels.parent_channel_id is null
        group by channels.id
    ) comment_count join (
        select channels.id, count(events.id) num_of_events
        from channels left join events on channels.id=events.channel_id
        where channels.parent_channel_id is null
        group by channels.id
    ) event_count
    on comment_count.id = event_count.id
    """
    res = ActiveRecord::Base.connection.select_all(sql)
    logger.debug(res.to_a)
    @result = Hash.new
    @result["channels"] = res.to_a
    respond_to do |format|
      format.json { render json: @result, status: :ok}
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  # Author Yusuke Otsuki
  def show
    channelId = params[:id]

    # 該当チャンネル取得
    channelSql = "select name, abstract , parent_channel_id from channels
    where id = " + channelId

    channel = ActiveRecord::Base.connection.select_one(channelSql).to_hash

    # 該当チャンネルのコメント取得
    commentSql = "select id, user_id, channel_id, message from comments 
    where channel_id = " + channelId

    comments = ActiveRecord::Base.connection.select_all(commentSql)

    # コメントのハッシュの配列を作成
    result = comments.to_hash

    logger.debug(result[0])

    # 特定コメントに対して子コメントを取得
    commentIds = result.map { |c| c["id"] }.join(',')
    childChannelSql = "select id, parent_comment_id from channels where parent_comment_id in (" + commentIds + ")"
    childChannels = ActiveRecord::Base.connection.select_all(childChannelSql).to_hash
    childChannelIds = childChannels.map { |c| c["id"] }.join(',')
    childCommentSql = "select channel_id from comments where channel_id in (" + childChannelIds + ")"
    childComments = ActiveRecord::Base.connection.select_all(childCommentSql).to_hash

    childCommentNumber = Hash.new
    childChannels.each_with_index do |x, i|
      c = childComments.select { |n| n["channel_id"] == childChannels[i]["id"] }.size
      childCommentNumber[childChannels[i]["id"]] = c
    end



    # コメントのハッシュを作成
    commentResult = Array.new
    commentArray = result.to_a
    commentArray.each_with_index do |x, i|
      commentResult[i] = {comment_id:commentArray[i]["id"], user_id:commentArray[i]["user_id"], 
      channel_id:commentArray[i]["channel_id"], message:commentArray[i]["message"]}
      
      childChannels.each_with_index do |y, j|
        if childChannels[j]["parent_comment_id"] == commentArray[i]["id"] then
          childChannnel = {channel_id: childChannels[j]["id"], num_of_comments: childCommentNumber[childChannels[j]["id"]]}
          commentResult[i]["child_channel"] = childChannnel
        end
      end
    end

    # チャンネルのハッシュを作成
    channelHash = Hash.new
    channelHash = {comments:commentResult, is_root: channel["parent_channel_id"].nil?, channel_name: channel["name"], channel_abstract: channel["abstract"]}
 
    respond_to do |format|
      format.json { render json: channelHash, status: :ok}
    end

  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  # author yusuke otsuki
  def create
    @channel = Channel.new(channel_params)

    if @channel.save
      render status: 201, json: { status: 201 }
    else 
      render status: 400, json: { status: 400 }
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:name, :abstract, :parent_channel_id, :parent_comment_id)
    end
end
