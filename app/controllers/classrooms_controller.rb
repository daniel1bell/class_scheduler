class ClassroomsController < ApplicationController
  before_filter :load_location

  def new
    @classroom = @location.classrooms
  end

  def create
    @classroom = @location.classrooms.create(params[:classroom])

    if @classroom.save
      redirect_to root_path, notice: 'Classroom was successfully created.' 
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
      redirect_to root_path, notice: 'Classroom was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @classroom = @location.classrooms.find(params[:id])
    @classroom.destroy

    redirect_to locations_path
  end

  private
  def load_location
    @location = Location.find(params[:location_id])
  end
end
