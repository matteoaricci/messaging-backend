class RoomsController < ApplicationController
    def index
        rooms = Room.all 
        render json: rooms
    end
    
    def create
        room = Room.create(room_params)

        render json: room
    end

    def room_messages
        room = Room.find_by(id: params[:id])

        messages = room.messages 

        render json: messages
    end

    private

    def room_params
        params.require(:room).permit(:room_number, :topic)
    end

end
