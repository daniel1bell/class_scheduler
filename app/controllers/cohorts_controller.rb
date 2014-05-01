class CohortsController < ApplicationController
  before_filter :load_course

  def show
    @cohort = @course.cohorts.find(params[:id])
  end

  def new
    @cohort = @course.cohorts.build
  end

  def create
    @cohort = @course.cohorts.new(params[:cohort])

    if @cohort.save
      redirect_to dashboard_index_path, notice: 'Cohort was successfully created.' 
    else
      render action: "new" 
    end
  end

  def edit
    @cohort = @course.cohorts.find(params[:id])
  end

  def update
    @cohort = @course.cohorts.find(params[:id])

    if @cohort.update_attributes(params[:cohort])
      redirect_to dashboard_index_path, notice: 'Cohort was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @cohort = @course.cohorts.find(params[:id])
    @cohort.destroy

    redirect_to dashboard_index_path
  end

  private
  def load_course
    @course = Course.find(params[:course_id])
  end
end
