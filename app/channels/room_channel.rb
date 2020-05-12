class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    room = Room.find_by(params[:room_number])
    stream_for room
  end

  def recieved(data)
    ActionCable.server.broadcast(room, data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
