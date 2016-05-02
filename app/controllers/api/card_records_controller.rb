class Api::CardRecordsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end
  def show

      @card_record = CardRecord.find_by(id: params[:id])
      render json: @card_record
  end
end
