class AddMoreColumnsToNanny < ActiveRecord::Migration[5.2]
  def change
    add_column :nannies, :experience, :string
    add_column :nannies, :city, :string
    add_column :nannies, :birth_date, :date
    add_column :nannies, :moving_area, :string
    add_column :nannies, :description, :text
  end

  add_monetize :nannies, :price_per_day, currency: { present: false }
end
