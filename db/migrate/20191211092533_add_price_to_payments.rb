class AddPriceToPayments < ActiveRecord::Migration[5.2]
  def change
    add_monetize :payments, :price, currency: { present: false }
  end
end
