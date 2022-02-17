class UsersController < ApplicationController
  before_action :require_login, except: %i[index new]
  before_action :set_user?, only: %i[show edit]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "#{@user.name} was successfullty created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "#{@user.name} successfuly updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    flash[:notice] = "User #{@user.name} could not be found. Redirected to your homepage."
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :admin)
  end

  def set_user?
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:notice] = 'User could not be found. Redirected to your homepage.'
      redirect_to user_path(current_user)
    end
  end
end
