class InternalEntry::CardsController < ApplicationController
  #TODO: Show cards and their records
  def index
    @cards = Card.all
    @patients = Patient.all.page(params[:patients_page].to_i)
  end
end
