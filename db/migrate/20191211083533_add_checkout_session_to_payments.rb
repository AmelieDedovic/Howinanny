class AddCheckoutSessionToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :checkout_session_id, :string
  end
end
