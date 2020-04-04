class LikesController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @presenter = present(@post.likes.with_user)
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post = @post
    @like.user = current_user

    if @like.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      render 'pages/home'
    end
  end

  def destroy
    @like = Like.find(params[:id])

    if @like.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end
