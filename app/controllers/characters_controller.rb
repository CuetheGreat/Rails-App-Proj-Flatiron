class CharactersController < ApplicationController
  before_action :require_login
  before_action :character_set?, only: %i[show edit]
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to user_path(current_user)
      else
        @characters = Character.where(user_id: @user.id)
      end
    else
      @characters = Character.all
    end
  end

  def new
    @character = Character.new
    @character.build_nested
    user = User.find_by(id: params[:id]) if params[:user_id]
    redirect_to user_path(current_user) if user.nil?
    @character.user = user
  end

  def create
    @character = Character.new(character_params)
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        flash[:notice] = 'User could not be found.'
        redirect_to users_path
      else
        @character.user = user
      end
    else
      @character.user = current_user
    end
    if @character.save
      redirect_to @character, notice: "#{@character.name} has been successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        flash[:notice] = 'User could not be found.'
        redirect_to users_path
      else
        @character = Character.find_by(id: params[:id], user:)
      end
    else
      @character = Character.find_by(id: params[:id])
    end
  end

  def edit
    @character = Character.find_by(id: params[:id])
  end

  def update
    @character = Character.find_by(id: params[:id])
    if @character.update(character_params)
      redirect_to @character, notice: "#{@character.name} has been successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find_by(id: params[:id])
    @character.destroy
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :race_id, :job_id, :party_id, abilities_attributes: %i[id value name])
  end

  def character_set?
    @character = Character.find_by(id: params[:id])
    if @character.nil?
      flash[:notice] = "Character with the ID:#{params[:id]} could not be found."
      redirect_to characters_path
    end
  end
end
