class InternalEntry::CardRecordsController < ApplicationController
  def new
    @record = CardRecord.new
    @card = Patient.find(params[:doctor_reception][:patient_id]).card
  end

  def create
    @card_record = CardRecord.new(card_record_params)
    @current_doctor = current_user.employee.doctor
    @card_record.attributes = {doctor_id: @current_doctor.id, medical_speciality_id: @current_doctor.medical_speciality_id, add_date: Date.today}
    # @card_record.save
  end

  def show
    medical_speciality_id = params[:medical_speciality]
    @card_records = CardRecord.get_patient_records_by_medic(Patient.find_by(user_id: current_user.id).id, medical_speciality_id)
  end

  private
  def card_record_params
    params.require(:card_record).permit(:symptoms,:diagnosis, :treatment, :card_id)
  end
end
