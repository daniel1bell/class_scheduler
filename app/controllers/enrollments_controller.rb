class EnrollmentsController < ApplicationController
  before_filter :load_course, :load_cohort

  def new
    @enrollment = @cohort.enrollments.build
  end

  def create
    @enrollment = @cohort.enrollments.new(params[:enrollment])

    if @enrollment.save
      redirect_to course_cohort_path(@course, @cohort), notice: 'Enrollment was successfully created.' 
    else
      render action: "new" 
    end
  end

  def edit
    @enrollment = @cohort.enrollments.find(params[:id])
  end

  def update
    @enrollment = @cohort.enrollments.find(params[:id])

    if @enrollment.update_attributes(params[:enrollment])
      redirect_to course_cohort_path(@course, @cohort), notice: 'Enrollment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @enrollment = @cohort.enrollments.find(params[:id])
    @enrollment.destroy

    redirect_to course_cohort_path(@course, @cohort)
  end

  private
  def load_course
    @course = Course.find(params[:course_id])
  end

  private
  def load_cohort
    @cohort = Cohort.find(params[:cohort_id])
  end

end
