class InstructorAssignmentsController < ApplicationController
  before_filter :load_course, :load_cohort
  load_and_authorize_resource :course
  load_and_authorize_resource :cohort, :through => :course
  load_and_authorize_resource :instructor_assignment, :through => :cohort

  def new
    @instructor_assignment = @cohort.instructor_assignments.build
    @instructors = User.where(role: 'Instructor')
  end

  def create
    @instructor_assignment = @cohort.instructor_assignments.new(params[:instructor_assignment])

    if @instructor_assignment.save
      redirect_to course_cohort_path(@course, @cohort), notice: 'Instructor Assignment was successfully created.' 
    else
      render action: "new" 
    end
  end

  def edit
    @instructor_assignment = @cohort.instructor_assignments.find(params[:id])
  end

  def update
    @instructor_assignment = @cohort.instructor_assignments.find(params[:id])

    if @instructor_assignment.update_attributes(params[:instructor_assignment])
      redirect_to course_cohort_path(@course, @cohort), notice: 'Instructor Assignment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @instructor_assignment = @cohort.instructor_assignments.find(params[:id])
    @instructor_assignment.destroy

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
