class AddStateToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :state, :string, default: 'pending'
  end
end
