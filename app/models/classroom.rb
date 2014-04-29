class Classroom < ActiveRecord::Base
  belongs_to :location
  has_many :bookings
  has_many :cohorts, through: :bookings

  attr_accessible :capacity, :facilities, :location_id, :name

  private
  def details
    "#{location.name} - #{name}"
  end
end
