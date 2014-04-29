class User < ActiveRecord::Base
  has_many :instructor_assignments
  has_many :enrollments

  attr_accessible :email, :first_name, :last_name, :role, :username
end
