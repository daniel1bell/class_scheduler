class User < ActiveRecord::Base
  has_secure_password

  has_many :instructor_assignments, foreign_key: "instructor_id"
  has_many :enrollments, foreign_key: "student_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  attr_accessible :email, :first_name, :last_name, :role, :username, :password, :password_confirmation

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
