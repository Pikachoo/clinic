class Doctor < ActiveRecord::Base
  belongs_to :employee
  has_many :doctor_receptions
  has_many :doctor_week_shedule
end
