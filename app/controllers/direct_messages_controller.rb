class DirectMessagesController < ApplicationController
  def index
    @presenter = current_user.present
  end

  def show
    @direct_message = DirectMessage.find(params[:id])
    @presenter = present(@direct_message)
  end
end
