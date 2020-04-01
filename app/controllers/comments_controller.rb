class CommentsController < ApplicationController
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
