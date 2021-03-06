class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  helper_method :current_user

  def logged_in?
    session[:user_id].present?
  end

  helper_method :logged_in?

  def require_logged_in
    if !logged_in?
      flash[:alert] = "You must log in first"
      redirect_to new_session_url
    end
  end
end
