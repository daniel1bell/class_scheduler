class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :cohort
      t.references :classroom
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :bookings, :cohort_id
    add_index :bookings, :classroom_id
  end
end
