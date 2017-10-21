class Admin::BaseController < ApplicationController
  before_action :require_logged_in
  before_action :require_admin_user


  def require_admin_user
    if !current_user.is_admin?
      flash[:alert] = "Sorry, admins only"
      redirect_to root_url
  end
end
