class CardRecord < ActiveRecord::Base
  def self.get_patient_records_by_medic(patient_id, medical_speciality_id)
     card = Card.find_by(patient_id: patient_id)
     if card
       CardRecord.where(card_id: card.id, medical_speciality_id: medical_speciality_id)
     else
       CardRecord.where('1=0')
     end

  end
end
