class PatientsController < ApplicationController
  def show
    @patient = Patient.find_by(user_id: current_user.id)
  end
end
