class BookingsController < ApplicationController
  load_and_authorize_resource :booking

  def index
    @classrooms = Classroom.all

    # for the calendar plugin
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @booking = Booking.new(params[:booking])
    @classroom = @booking.classroom
    @cohort = @booking.cohort
  end

  def create
    start_date = (params[:booking])[:start_date]
    cohort = Cohort.find((params[:booking])[:cohort_id])
    course_duration = cohort.course.duration_weeks
    params[:booking][:end_date] = start_date.to_date + ( course_duration * 7).days

    @booking = Booking.new(params[:booking])

    if @booking.save
      redirect_to bookings_path, notice: 'Classroom was successfully created.' 
    else
      render action: "new" 
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @classroom = @booking.classroom
    @cohort = @booking.cohort
    @booking_req = {cohort_id: @booking.cohort_id, classroom_id: @booking.classroom_id}
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update_attributes(params[:booking])
      redirect_to bookings_path, notice: 'Location was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end
end