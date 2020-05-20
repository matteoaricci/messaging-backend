class ForumChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    secret_key = Rails.application.secrets.secret_key_base.to_s
    
    decoded = JWT.decode(data["userId"], secret_key, true, {alg: 'HS256'})
    new_message = Message.create(user_id: decoded[0]['user_id'], room_id: data['roomId'], content: data['text'])
    
    data["author"] = User.find_by(id: decoded[0]['user_id']).name
    data['message'] = new_message

    info_to_return = {author: data["author"], message: data['message']}
    ActionCable.server.broadcast("chat_#{params[:room]}", info_to_return)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
