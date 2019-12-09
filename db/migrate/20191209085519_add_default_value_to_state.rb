class AddDefaultValueToState < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:reservations, :state, 'pending')
  end
end
