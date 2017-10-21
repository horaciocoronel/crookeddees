class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Congrats!"
      session[:user_id] = @user.id
      redirect_to appointments_url
    else
      flash[:alert] = "Please correct mistakes"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone)
  end
end
