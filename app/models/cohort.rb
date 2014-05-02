class Cohort < ActiveRecord::Base
  belongs_to :course
  has_many :enrollments
  has_many :students, through: :enrollments, class_name: "User", foreign_key: "student_id"
  has_many :instructor_assignments
  has_many :instructors, through: :instructor_assignments, class_name: "User", foreign_key: "instructor_id"
  has_many :bookings
  attr_accessible :iteration, :start_date, :course_id

  
  def name
    "#{course.name} - #{iteration}"
  end

  def if_booked
    if !bookings.empty?
      bookings.first.start_date
    else
      "Not Scheduled"
    end
  end

  def instructor_names
    names = []
    instructors.each do |instructor|
      names << instructor.name
    end
    names.join(', ')
  end

  def cohort_payments
    student_payments = []
    enrollments.each do |enrollment|
      student_payments << enrollment.paid_amount
    end
    student_payments.inject{|sum,x| sum + x }
  end

  def cohort_total_payments_due
    course.price * students.count
  end

  def cohort_outstanding_balance
    cohort_total_payments_due - cohort_payments
  end

end
