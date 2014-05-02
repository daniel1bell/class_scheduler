class Course < ActiveRecord::Base
  has_many :cohorts, dependent: :destroy
  attr_accessible :duration_weeks, :instructors_req, :name, :price
end
