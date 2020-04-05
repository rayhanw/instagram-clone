class DirectMessagesController < ApplicationController
  def index
    @presenter = current_user.present
  end

  def show
    @direct_message = DirectMessage.find(params[:id])
    @presenter = present(@direct_message)
  end

  def new
    @direct_message = DirectMessage.new
    @user_list = current_user.not_conversed_with
  end

  def create
    @direct_message = DirectMessage.new(direct_message_params)
    @direct_message.sender = current_user

    if @direct_message.save
      redirect_to direct_message_path(@direct_message)
    else
      render :new
    end
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:receiver_id)
  end
end
