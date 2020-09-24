class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/channel/:channel_id
  def comment_list
    sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      [
        """
        select comments.id, comments.user_id, comments.channel_id, comments.message, child.id child_channel_id ,child.num_of_comments
        from comments left join (     
          select channels.id, channels.parent_comment_id, count(comments.id) num_of_comments     
          from channels left join comments on channels.id=comments.channel_id     
          where channels.parent_channel_id is not null     
          group by channels.id ) child on comments.id=child.parent_comment_id 
        where comments.channel_id=?
        """, params[:channel_id]]
    )
    res = ActiveRecord::Base.connection.select_all(sql)
    logger.debug(res.to_a)
    @result = Hash.new
    @result['comments'] = res.to_a
    respond_to do |format|
      format.json {render json: @result, status: :ok}
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.json { render :show, status: :created, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :channel_id, :message)
    end
end
