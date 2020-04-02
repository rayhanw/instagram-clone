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
      CommentsChannel.broadcast_to(@post, render_to_string(partial: "content", locals: { comment: @comment, first: @post.first_comment?(@comment) }))
      redirect_to post_comments_path(@post, anchor: "comment-#{@comment.id}")
    else
      render 'pages/home'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
