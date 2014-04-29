class Booking < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :classroom
  attr_accessible :end_date, :start_date, :cohort_id, :classrooom_id
end
