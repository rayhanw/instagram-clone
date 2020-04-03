class PostsController < ApplicationController
  before_action :set_back_link, only: :show

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path, notice: "Post successfully deleted."
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, photos: [])
  end

  def set_back_link
    session[:back_link] ||= request.url
  end
end
