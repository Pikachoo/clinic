class Employee < ActiveRecord::Base
  has_one :doctor
  belongs_to :user
end
