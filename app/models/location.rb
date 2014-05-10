class Location < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy
  attr_accessible :name
end
