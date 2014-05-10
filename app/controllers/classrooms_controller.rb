class ClassroomsController < ApplicationController
  before_filter :load_location
  load_and_authorize_resource :location
  load_and_authorize_resource :classroom, :through => :location

  def show
    @classroom = @location.classrooms.find(params[:id])
    @bookings = @classroom.bookings
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @classroom = @location.classrooms.build
  end

  def create
    @classroom = @location.classrooms.new(params[:classroom])

    if @classroom.save
      redirect_to dashboard_index_path, notice: 'Classroom was successfully created.' 
    else
      render action: "new" 
    end
  end

  def edit
    @classroom = @location.classrooms.find(params[:id])
  end

  def update
    @classroom = @location.classrooms.find(params[:id])

    if @classroom.update_attributes(params[:classroom])
      redirect_to dashboard_index_path, notice: 'Classroom was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @classroom = @location.classrooms.find(params[:id])
    @classroom.destroy

    redirect_to dashboard_index_path
  end

  private
  def load_location
    @location = Location.find(params[:location_id])
  end
end
