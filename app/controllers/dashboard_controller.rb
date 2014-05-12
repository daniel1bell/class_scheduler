class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    @locations = Location.all
    @courses = Course.all
    @users = User.all

    # for the calendar plugin
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def redraw_calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_to do |format|
      format.js
      format.html {
        render text: 'Hello World'
      }
    end
  end

end