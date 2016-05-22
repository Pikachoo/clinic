class InternalEntry::CardsController < ApplicationController
  def new

    @patient = Patient.find(params[:patient])
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)

  end
  def show

  end
  private
  def card_params
    params.require(:card).permit(:height,:weight, :blood_type, :bp_s, :bp_d, :pulse, :patient_id)
  end
end
