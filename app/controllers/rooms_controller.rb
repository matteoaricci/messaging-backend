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

        messages = Message.where(room_id: params[:id])

        chat_history = messages.map {|message| {author: User.find(message.user_id).name, message: message} }
        render json: chat_history
    end

    private

    def room_params
        params.require(:room).permit(:room_number, :topic)
    end

end
