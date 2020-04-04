class DirectMessagesChannel < ApplicationCable::Channel
  def subscribed
    direct_message = DirectMessage.find(params[:id])

    stream_for direct_message
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
