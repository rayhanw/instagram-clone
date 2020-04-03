class PagesController < ApplicationController
  before_action :set_current_page, only: :home

  def home
    @presenter = present(Post, @current_page)

    if @current_page > 1
      @posts = Post.with_photo_blobs.sorted_by_date.includes(:likes, user: [avatar_attachment: [:blob]], comments: [:user]).paginate(page: @current_page, per_page: 8)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def explore; end

  def account
    @presenter = current_user.present
  end

  private

  def set_current_page
    @current_page = params[:page]&.to_i || 1
  end
end
