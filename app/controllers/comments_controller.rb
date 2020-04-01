class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(user: [:avatar_attachment])
    @new_comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      redirect_to post_comments_path(@post)
    else
      render 'pages/home'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
