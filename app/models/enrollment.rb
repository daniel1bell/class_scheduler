class Enrollment < ActiveRecord::Base
  belongs_to :student, class_name: "User"
  belongs_to :cohort
  attr_accessible :paid_amount, :prework_done, :student_id, :cohort_id

  def name

  end
  
end
