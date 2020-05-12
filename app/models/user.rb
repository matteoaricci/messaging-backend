class User < ApplicationRecord
    has_secure_password

    has_many :messages
    has_many :rooms, through: :messages

    has_many :private_messages, class_name: "User", foreign_key: :sender_id
    has_many :private_messages, class_name: "User", foreign_key: :recipient_id 

end
