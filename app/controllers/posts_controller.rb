class PostsController < ApplicationController

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to @post
  end

  def show
    @post = find_post
  end

  def edit
    @post = find_post
  end

  def update
    @post = find_post

    if @post.update(edit_post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = find_post
    @post.destroy

    redirect_to root_path
  end

  private

  def find_post
    Post.find(params[:id])
  end
  #private method to allow the post to permit and save data for the title and description
  def post_params
    params.require(:post).permit(:title, :description)
  end

  #edit post
  def edit_post_params
    params[:post].permit(:title, :description)
  end

end
