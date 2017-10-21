class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to appointments_url
    else
      flash[:alert] = "Email or password incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
