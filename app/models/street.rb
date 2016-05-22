class Street < ActiveRecord::Base
  has_many :patients
  belongs_to :street_type

  def get_name_with_type
    self.street_type.short_name + '. ' + self.name
  end
end
