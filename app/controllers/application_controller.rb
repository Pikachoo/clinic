class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    if session[:user_id]
      user = User.where(id: session[:user_id]).first
      if user
        @current_user = user
      else
        @current_user = nil
        session[:user_id] = nil
      end
    end
  end
end
