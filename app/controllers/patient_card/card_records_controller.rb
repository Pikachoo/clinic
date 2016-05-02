module PatientCard

  class CardRecordsController < ApplicationController
    def index
      medical_speciality_id = params[:medical_speciality_id]
      @medical_speciality = MedicalSpeciality.find(medical_speciality_id)
      @card_records = CardRecord.get_patient_records_by_medic(Patient.find_by(user_id: current_user.id).id, medical_speciality_id)
      @card_record = @card_records.order(:add_date).last

    end


    def show
      medical_speciality_id = params[:medical_speciality_id]
      @medical_speciality = MedicalSpeciality.find(medical_speciality_id)
      @card_records = CardRecord.get_patient_records_by_medic(Patient.find_by(user_id: current_user.id).id, medical_speciality_id)
      @card_record = CardRecord.find_by(id: params[:id])
    end
  end

end

