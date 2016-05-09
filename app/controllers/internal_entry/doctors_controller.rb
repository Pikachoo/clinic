class InternalEntry::DoctorsController < ApplicationController

  def show
    @employee = Employee.find_by(user_id: current_user.id)
  end

  def get_form_unplanned_patient

  end
end
