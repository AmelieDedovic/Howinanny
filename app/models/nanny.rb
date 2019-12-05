class Nanny < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  monetize :price_per_day_cents

  MOVING_AREA = %(France Europe Monde)

  # include PgSearch::Model
  # pg_search_scope :search_by_moving_area,
  #   against: [ :moving_area],
  #   using: {
  #     tsearch
  #   }
end
