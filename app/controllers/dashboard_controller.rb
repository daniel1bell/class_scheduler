class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    @locations = Location.all
    @courses = Course.all
    @users = User.all
  end    

end