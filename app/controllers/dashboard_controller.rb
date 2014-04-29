class DashboardController < ApplicationController

  def index
    @locations = Location.all  
  end    

end