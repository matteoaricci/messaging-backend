class RoomsController < ApplicationController
    def index
        rooms = Room.all 
        render json: rooms
    end
    
    def create
        room = Room.create(room_params)

        render json: room
    end

    private

    def room_params
        params.require(:room).permit(:room_number, :topic)
    end

end
