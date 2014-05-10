class Classroom < ActiveRecord::Base
  belongs_to :location
  has_many :bookings, dependent: :destroy
  has_many :cohorts, through: :bookings

  attr_accessible :capacity, :facilities, :location_id, :name

  def details
    "#{location.name} - #{name}"
  end
end
