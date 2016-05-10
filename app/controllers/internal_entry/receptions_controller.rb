class InternalEntry::ReceptionsController < ApplicationController
  def index
    get_timetable
    get_next_reception
  end

  def show
    get_timetable
    @reception = @doctor_receptions.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.find_by(patient_params)
    @record = CardRecord.new
    if @patient
      @card = @patient.card
      render 'internal_entry/card_records/new'
    else
      flash[:error] = 'Нет карточки. Проверьте правильность данных.'
      @patient = Patient.new(patient_params)
      render 'internal_entry/receptions/new'
    end

  end

  private

  def get_timetable
    flash[:notice] = nil

    @current_employee = current_user.employee
    @current_doctor = @current_employee.doctor
    @doctor_receptions = @current_doctor.doctor_receptions.where("DATE(date_time) = '" + Date.today.to_s + "'")
    @doctor_shedule = DoctorWeekShedule.get_today_timetable(@current_doctor.doctor_week_shedule)

    unless @doctor_shedule
      flash[:notice] = 'Сегодня выходной.'
    end

  end
  def get_next_reception
    @reception = @doctor_receptions.where(is_served: false).order(:date_time).first
  end
  def patient_params
    params.require(:patient).permit(:name,:surname, :birthdate, :patronymic)

  end

end
