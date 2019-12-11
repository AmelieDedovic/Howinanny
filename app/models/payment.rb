class Payment < ApplicationRecord
  belongs_to :reservation
  monetize :price_cents
end
