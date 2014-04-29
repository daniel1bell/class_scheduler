class Course < ActiveRecord::Base
  has_many :cohorts
  attr_accessible :duration_weeks, :instructors_req, :name, :price
end
