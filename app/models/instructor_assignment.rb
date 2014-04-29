class InstructorAssignment < ActiveRecord::Base
  belongs_to :instructor, class_name: "User"
  belongs_to :cohort
  # has_many :instructors
  # has_many :cohorts
  
  attr_accessible :instructor_id, :cohort_id
end
