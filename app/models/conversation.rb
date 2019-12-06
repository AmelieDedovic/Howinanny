class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :nanny
  has_many :messages, dependent: :destroy
end
