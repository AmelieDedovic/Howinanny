class AddFirstNameAndLastNAmeToNannies < ActiveRecord::Migration[5.2]
  def change
    add_column :nannies, :first_name, :string
    add_column :nannies, :last_name, :string
  end
end
