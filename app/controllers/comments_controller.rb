class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @post.save && @comment.save
      redirect_to @post
    else
      redirect_to @post
      flash[:notice] = "we need something here"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
