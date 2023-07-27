class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person, presence: true, numericality: {greater_than: 0}
  validate :end_date_after_start_date

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "はチェックイン日よりも後に設定してください。")
    end
  end

  def stay_days
    (end_date - start_date).to_i/86400
  end

  def total_price
    room = Room.find(room_id)
    (end_date - start_date).to_i/86400 * person * room.price
  end
end