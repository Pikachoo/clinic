class Employee < ActiveRecord::Base
  has_one :doctor
  belongs_to :user
  belongs_to :passport_series
end
