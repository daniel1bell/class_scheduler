class CoursesController < ApplicationController

  def index
    @courses = Course.all  
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])

    if @course.save
      redirect_to dashboard_index_path, notice: 'Course was successfully created.' 
    else
      render action: "new" 
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to dashboard_index_path, notice: 'Course was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to dashboard_index_path
  end

end
