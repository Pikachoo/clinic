class Illness < ActiveRecord::Base
  has_many :illness_symptoms
end
