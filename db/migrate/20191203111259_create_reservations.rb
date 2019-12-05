class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :state
      t.references :user, foreign_key: true
      t.references :nanny, foreign_key: true

      t.timestamps
    end

    add_monetize :reservations, :total_price, currency: { present: false }
  end
end
