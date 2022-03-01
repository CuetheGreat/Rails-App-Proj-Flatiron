class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

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

  def admin?
    if logged_in?
      (redirect_to user_path(current_user), notice: 'You are not an admin.') unless current_user.admin
    else
      flash[:notice] = 'Please sign in '
      redirect_to root_path
    end
  end
end
