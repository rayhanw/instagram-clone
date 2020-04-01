class PagesController < ApplicationController
  def home
    @presenter = present(Post)
  end

  def explore; end

  def account; end
end
