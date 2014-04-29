class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.references :location
      t.integer :capacity
      t.text :facilities

      t.timestamps
    end
    add_index :classrooms, :location_id
  end
end
