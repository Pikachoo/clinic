class ExternalEntry::CardsController < ApplicationController
  def show
    @medical_specialities = MedicalSpeciality.all.order(:name)
    @card = Card.get_card_by_user(current_user.id).last
    @last_card_record =  CardRecord.where(card_id: @card.id).order(:add_date).last
    @doctor = Employee.find_by(id: @last_card_record.employee_id)
  end
end
