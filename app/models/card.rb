class Card < ActiveRecord::Base
  belongs_to :patient
  def self.get_card_by_user(user_id)
    patient = Patient.find_by(user_id: user_id)
    puts !patient.nil?
    puts json: patient
    if !patient.nil?
       card = Card.where(patient_id: patient.id)
      puts 'hgfg'
    else
       card = Card.where('1=0')
    end

    card
  end
end
