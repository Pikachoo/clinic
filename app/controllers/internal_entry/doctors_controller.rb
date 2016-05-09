class InternalEntry::DoctorsController < ApplicationController

  def show
    @employee = Employee.find_by(user_id: current_user.id)
  end

end
