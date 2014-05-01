class User < ActiveRecord::Base
  has_many :instructor_assignments, foreign_key: "instructor_id"
  has_many :enrollments, foreign_key: "student_id"

  attr_accessible :email, :first_name, :last_name, :role, :username

  def name
    "#{first_name} #{last_name}"
  end

  def cohort_relationships
      response = []
      instructor_assignments.each do |instructor_assignment|
        response << "#{instructor_assignment.cohort.name} Instructor"
      end
      enrollments.each do |enrollment|
        response << "#{enrollment.cohort.name} Student"
      end
      response.join(' | ')
  end

end
