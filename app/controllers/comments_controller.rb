class CommentsController < ApplicationController
  before_action :find_parent

  def show
  	@comment = @parent.comments.new comment_params
  end

  def create
    @comment = @parent.comments.new(comment_params)
    @comment.user = current_user
    if @parent.save && @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "we need something here"
    end
  end

  private

    def comment_params
      params[:comment][:user_id] = current_user.id
      params.require(:comment).permit(:body, :user_id)
    end

    def find_parent
      @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end
