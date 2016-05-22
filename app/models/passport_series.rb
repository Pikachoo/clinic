class PassportSeries < ActiveRecord::Base
  has_many :patients
  has_many :employees
end
