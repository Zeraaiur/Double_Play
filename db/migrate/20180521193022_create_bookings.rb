class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.reference :item
      t.reference :user
      t.datetime :pick_time
      t.datetime :return_time

      t.timestamps
    end
  end
end
