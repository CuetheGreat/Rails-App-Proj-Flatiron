class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'You have successfully signed in.'
    else
      redirect_to signin_path, alert: 'Username or password incorect'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path, notice: 'You have logged out successfully.'
  end

  def google_auth
    @user =
      User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['first_name']
        u.username = auth['info']['email']
        u.password = 'defaultPassword'
      end
    binding.pry
    session[:user_id] = @user.id
    redirect_to user_path(@user), notice: 'You have successfully signed in.'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
