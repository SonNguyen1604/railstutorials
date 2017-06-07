class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        "1" == params[:session][:remember_me] ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = t ".not_activated"
        message += t ".check_mail"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = t ".fail"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t ".logout"
    redirect_to root_url
  end
end
