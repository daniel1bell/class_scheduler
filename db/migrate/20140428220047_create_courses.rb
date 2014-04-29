class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :instructors_req
      t.integer :duration_weeks
      t.decimal :price

      t.timestamps
    end
  end
end
