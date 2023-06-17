class Room < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reservations
    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :price, presence: true
    validates :address, presence: true
end
