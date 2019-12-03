class AddMoreColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :users, :description, :text
  end
end
