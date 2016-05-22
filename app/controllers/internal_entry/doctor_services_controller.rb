class InternalEntry::DoctorServicesController < ApplicationController
  def show
    @illness = Illness.new

  end
  def show_diagnoses
    @illness_by_symptoms =  IllnessSymptom.where('symptom_id in (?)', params[:symptoms])
    @diagnoses = Illness.find(@illness_by_symptoms.collect do |illness| illness.illness_id end )
    puts json: @illness_by_symptoms.collect { |illness| illness.illness_id }
  end
end
