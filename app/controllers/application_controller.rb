class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_patient
  helper_method :current_employee
  rescue_from CanCan::AccessDenied do |exception|
    puts exception
    render :file => 'public/502.html', :status => :forbidden, :layout => false, alert: exception.message
  end

  private

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
  def current_patient
    @current_patient ||= Patient.find_by(user_id: current_user.id)
  end
  def current_employee
    @current_employee ||= Employee.find_by(user_id: current_user.id)
  end

end
