class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reservations, dependent: :destroy
    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :price, presence: true
    validates :address, presence: true
    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "id", "price", "room_image", "room_introduction", "room_name", "updated_at", "user_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["image_attachment", "image_blob", "reservations", "user"]
    end
    # 上のアクションと一緒に定義しようとしたらエラーが出たため分離して記述
end
