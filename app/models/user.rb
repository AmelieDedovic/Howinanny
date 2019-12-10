class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :nannies, through: :reservations
  has_many :conversations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
end
