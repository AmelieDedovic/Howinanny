class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :state
      t.integer :total_price
      t.references :user, foreign_key: true
      t.references :nanny, foreign_key: true

      t.timestamps
    end
  end
end
