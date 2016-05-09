class InternalEntry::ReceptionsController < ApplicationController
  def index
    get_timetable
    get_next_reception
  end

  def show
    get_timetable
    @reception = @doctor_receptions.find(params[:id])
  end

  private

  def get_timetable
    @current_employee = current_user.employee
    @current_doctor = @current_employee.doctor
    @doctor_receptions = @current_doctor.doctor_receptions.where("DATE(date_time) = '" + Date.today.to_s + "'")
    @doctor_shedule = DoctorWeekShedule.get_today_timetable(@current_employee.id)
  end
  def get_next_reception
    @reception = @doctor_receptions.where(is_served: false).order(:date_time).first
  end

end
