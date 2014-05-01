class CreateEnrollmentsAgain < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :student
      t.references :cohort
      t.boolean :prework_done
      t.decimal :paid_amount

      t.timestamps
    end
    add_index :enrollments, :student_id
    add_index :enrollments, :cohort_id
  end
end
