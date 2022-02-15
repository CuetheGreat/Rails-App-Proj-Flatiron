class CharactersController < ApplicationController
  before_action :require_login
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      redirect_to user_path(current_user) if @user.nil?
      @characters = Character.where(user_id: @user.id)
    else
      @characters = Character.all
    end
  end

  def new
    @character = Character.new
  end

  def create
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @character = Character.new(character_params)
    end
    if @character.save
      redirect_to @character, notice: "#{@character.name} has been successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @character = Character.find_by(id: params[:id])
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
end
