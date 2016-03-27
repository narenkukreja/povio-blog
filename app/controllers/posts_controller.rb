class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  #add JSON/XML views for posts
  respond_to :json, :xml

  def index
    @posts = Post.all.order('created_at DESC')
    respond_with(@posts)

  end

  def new
    @post = current_user.posts.build
  end

  def create

    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to @post
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end

  end

  def show
    @post = find_post
    respond_with(@post)

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

  #find post by its id
  def find_post
    Post.find(params[:id])
  end

  #private method to allow the post to permit and save data for the title and description
  def post_params
    params.require(:post).permit(:title, :description, :username)
  end

  #edit post
  def edit_post_params
    params[:post].permit(:title, :description, :username)
  end

end
