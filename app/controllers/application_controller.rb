class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    session[:user_id] ? User.find_by(id: session[:user_id]) : nil
  end

  def logged_in?
    !!current_user
  end

  private

  def require_login
    redirect_to root_path unless logged_in?
  end
end
