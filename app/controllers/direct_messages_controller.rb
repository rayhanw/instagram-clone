class DirectMessagesController < ApplicationController
  def index
    @presenter = current_user.present
  end

  def show
  end
end
