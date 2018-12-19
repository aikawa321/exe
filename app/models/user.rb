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
  accepts_attachments_for :images, attachment: :image
  has_many :reviews
 geocoded_by :address
 before_validation :geocode

  # Send message to other user
  def send_message(other_user, room_id, content)
    from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
  end

 enum area_id:{
  北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
 }
 enum kind_id:{
   介護付有料老人ホーム:1,住宅型有料老人ホーム:2,健康型有料老人ホーム:3,サービス付き高齢者向け住宅:4,グループホーム:5,特別養護老人ホーム:6,介護老人保健施設:7,介護療養型医療施設:8,ケアハウス:9
 }
  def self.search(search)
    if search
    User.where(['name LIKE ?', "%#{search}%"]).or(User.where(['address LIKE ?', "%#{search}%"]))
    else
    User.all
    end
  end
end
