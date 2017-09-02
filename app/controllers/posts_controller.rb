class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]
before_action :set_page, only: [:index]
PAGE_POSTS = 25

  def index
    @posts = Post.order(:id).limit(PAGE_POSTS).offset(@page*PAGE_POSTS.to_i)
  end

  def new
  	@post = Post.new
  end

  def show
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
		  params.require(:post).permit(:title, :text)
	 end

  def set_page
    @page = params[:page] || 0
  end
end
