class CommentsController < ApplicationController

  def new
    if params[:post_id]
      parent = Post.find(params[:post_id])
    elsif params[:id]
      parent = Comment.find(params[:id])
    end
  end

  def create
    if params[:post_id]
      parent = Post.find(params[:post_id])
    elsif params[:id]
      parent = Comment.find(params[:id])
    end

    comment = Comment.new
    comment.parent = parent

    comment = parent.comments.create(comment_params)
    comment.user = current_user
    if parent.save && comment.save
      redirect_to parent
    else
      redirect_to parent
      flash[:notice] = "we need something here"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
