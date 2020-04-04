class MessagesController < ApplicationController
  def create
    @direct_message = DirectMessage.find(params[:direct_message_id])
    @message = Message.new(message_params)
    @message.direct_message = @direct_message
    @message.author = current_user

    if @message.save
      redirect_to direct_message_path @direct_message, anchor: "message-#{@message.id}"
    else
      render 'direct_messages/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
