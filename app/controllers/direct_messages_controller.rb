class DirectMessagesController < ApplicationController
  def index
    @presenter = present(current_user)
  end

  def show
  end
end
