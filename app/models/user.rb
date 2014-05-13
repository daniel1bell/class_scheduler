class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  has_many :cohorts, through: :enrollments
  has_many :instructor_assignments, foreign_key: "instructor_id", dependent: :destroy
  has_many :enrollments, foreign_key: "student_id", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  attr_accessible :email, :first_name, :last_name, :role, :username, :password, :password_confirmation, :remember_me

  def name
    "#{first_name} #{last_name}"
  end

  def role?(role)
    self.role.to_s == role.to_s
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
