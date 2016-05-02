class SessionController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:name], params[:password])

    if user
      session[:user_id] = user.id
      if user.is? 'doctor'
        redirect_to show_timetable_path, :notice => "Вошли"
      elsif user.is? 'patient'
        redirect_to patient_path, :notice => "Вошли"
      end

    else
      flash[:error] = "Неправильный пароль и логин"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
