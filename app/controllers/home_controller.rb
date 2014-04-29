class HomeController < ApplicationController

  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
  end

end