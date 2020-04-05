class BookmarksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @bookmark = Bookmark.new
    @bookmark.post = @post
    @bookmark.user = current_user

    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      redirect_to root_path, notice: "Something bad happened!"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
