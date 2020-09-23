class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  # author: Hosoda Kyohei
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
  def show
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
