class CreateInstructorAssignments < ActiveRecord::Migration
  def change
    create_table :instructor_assignments do |t|
      t.references :instructor
      t.references :cohort

      t.timestamps
    end
    add_index :instructor_assignments, :instructor_id
    add_index :instructor_assignments, :cohort_id
  end
end
