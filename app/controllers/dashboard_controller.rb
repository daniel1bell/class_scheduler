class DashboardController < ApplicationController

  def index
    @locations = Location.all
    @courses = Course.all
    @users = User.all
  end    

end