class Booking < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :classroom
  attr_accessible :end_date, :start_date, :cohort_id, :classroom_id

  def cohort_students
    cohort.students.count
  end

  def cohort_instructors
    cohort.instructors.count
  end

  def class_size
    cohort_instructors + cohort_students
  end

end
