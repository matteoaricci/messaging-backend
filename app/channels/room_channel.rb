class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    room = Room.find_by(params[:room_number])
    messages = room.messages
    stream_for messages
  end

  def recieved(data)
    room = Room.find_by(params[:room_number])
    room_messages = room.messages
    ActionCable.server.broadcast(room_messages, data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
