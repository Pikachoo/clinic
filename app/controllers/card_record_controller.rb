class CardRecordController < ApplicationController
  def new

  end

  def show
    medical_speciality_id = params[:medical_speciality]
    @card_records = CardRecord.get_patient_records_by_medic(Patient.find_by(user_id: current_user.id).id, medical_speciality_id)
  end
end
