class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :nanny

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, uniqueness: { scope: :end_date }

  monetize :total_price_cents
end
