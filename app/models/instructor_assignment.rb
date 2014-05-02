class InstructorAssignment < ActiveRecord::Base
  belongs_to :instructor, class_name: "User"
  belongs_to :cohort
  # has_many :instructors
  # has_many :cohorts
  
  attr_accessible :instructor_id, :cohort_id

  def name
    instructor.name
  end

  def email
    instructor.email
  end

  def role
    instructor.role
  end

  def other_cohorts
    response = []
    instructor.instructor_assignments.each do |instructor_assignment|
      if instructor_assignment.cohort != cohort
        response << "#{instructor_assignment.cohort.name} Instructor"
      end
    end
    instructor.enrollments.each do |enrollment|
      if enrollment.cohort != cohort
        response << "#{enrollment.cohort.name} Student"
      end
    end
    if response.empty?
      result = "n/a"
    else
      result = response.join(' | ')
    end
    result
  end

end