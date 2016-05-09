class Patient < ActiveRecord::Base
  belongs_to :user
  has_one :card

  def get_initials
    puts name.chars.first
    initials = surname + ' ' + name.chars.first + '. ' + patronymic.chars.first + '. '
    initials
  end
end
