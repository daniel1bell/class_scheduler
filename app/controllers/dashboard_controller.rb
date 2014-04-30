class DashboardController < ApplicationController

  def index
    @locations = Location.all
    @courses = Course.all
  end    

end