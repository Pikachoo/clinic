class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :street
  has_one :card
  belongs_to :passport_series


  paginates_per 25

  def get_initials
    puts name.chars.first
    initials = surname + ' ' + name.chars.first + '. ' + patronymic.chars.first + '. '
    initials
  end


  def self.create_item(attributes = nil, &block)
    message = {success: nil, error: nil}

    begin

      patient = self.create(attributes, &block)
      patient_user = User.create_user(patient.id, 'patient')

      message[:success] = 'Пациент добавлен в базу.'
    rescue ActiveRecord::RecordNotUnique
      message[:error] = 'Пациент с таким индетификационным номером уже существует.'
    end

    message
  end
end
