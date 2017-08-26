class CommentsController < ApplicationController
  def show
  	@comment = Comment.find(params[:id])
  end

  def create
    if params[:add_comment]
      parent = Post.find(params[:post_id])
    elsif params[:reply_comment]
      parent = Comment.find params[:commenter_id]
    end

    @comment = parent.comments.create(comment_params)
    @comment.user = current_user
    if parent.save && @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "we need something here"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
