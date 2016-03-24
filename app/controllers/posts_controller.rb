class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  #private method to allow the post to permit and save data for the title and description
  def post_params
    params.require(:post).permit(:title, :description)
  end

end
