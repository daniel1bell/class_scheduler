class Enrollment < ActiveRecord::Base
  belongs_to :student, class_name: "User"
  belongs_to :cohort
  attr_accessible :paid_amount, :prework_done, :student_id, :cohort_id

  def name
    student.name
  end

  def email
    student.email
  end

  def role
    student.role
  end

  def outstanding_course_fee
    cohort.course.price - paid_amount
  end

  def prework
    if prework_done
      "Complete"
    else
      "Outstanding"
    end
  end

  def other_cohorts
    response = []
    student.instructor_assignments.each do |instructor_assignment|
      if instructor_assignment.cohort != cohort
        response << "#{instructor_assignment.cohort.name} Instructor"
      end
    end
    student.enrollments.each do |enrollment|
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
