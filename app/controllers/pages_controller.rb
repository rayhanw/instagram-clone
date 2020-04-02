class PagesController < ApplicationController
  def home
    @presenter = present(Post)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def explore; end

  def account; end
end
