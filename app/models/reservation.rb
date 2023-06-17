class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person, presence: true
  def stay_days
    (end_date - start_date).to_i
  end

  def total_price
    room = Room.find(room_id)
    (end_date - start_date).to_i * person * room.price
  end
end
