class ForumChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)

    byebug;
    # sender = get_sender(data)
    # room_id = data[:room]
    # message
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private
end
