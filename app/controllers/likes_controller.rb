class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post = @post
    @like.user = current_user

    if @like.save
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
    @like = Like.find(params[:id])

    if @like.destroy
      redirect_to root_path
    end
  end
end