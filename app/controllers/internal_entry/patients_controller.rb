class InternalEntry::PatientsController < ApplicationController
  #TODO: Show patients and their records
  def index
    @cards = Card.all
    @patients = Patient.all.page(params[:patients_page].to_i)
  end

  def new
    @patient = Patient.new
  end

  def create
    message = Patient.create_item(patient_params)
    puts json: message
    if message[:error].nil?
      redirect_to internal_entry_cards_path, flash: {success: ' Пациент добавлен.'}
    else
      flash[:error] = message[:error]
      @patient = Patient.new(patient_params)
      render 'internal_entry/cards/new'
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:name,:surname, :patronymic, :birthdate, :mobile_phone, :home_phone,
                                    :street_id, :house, :block, :appartment, :passport_series_id, :passport_number,
                                    :indetification_number, :email)
  end
end
