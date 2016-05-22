class IllnessSymptom < ActiveRecord::Base
  has_many :illnesses
  has_many :symptoms
end
