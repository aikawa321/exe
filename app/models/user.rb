class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :from_messages, class_name: "Message",
          foreign_key: "from_id", dependent: :destroy
  has_many :to_messages, class_name: "Message",
          foreign_key: "to_id", dependent: :destroy
  has_many :sent_messages, through: :from_messages, source: :from
  has_many :received_messages, through: :to_messages, source: :to
  has_many :images
 attachment :image
  # Send message to other user
  def send_message(other_user, room_id, content)
    from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
  end
  enum lank_id: {
    ☆☆☆☆★:1,☆☆☆★★:2,☆☆★★★:3,☆★★★★:4,★★★★★:5
  }
end
