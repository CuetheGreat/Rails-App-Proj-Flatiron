class CharactersController < ApplicationController
  before_action :require_login
  before_action :find_user_from_params
  before_action :guard_user_characters, only: %i[new edit]

  def index
    # - Find user if params exist
    if params[:user_id]
      # - set character to user's characters
      @characters = Character.where(user_id: @user.id) unless @user.nil?
    else
      # - set characters to all characters
      @characters = @characters = Character.all
    end
  end

  def new
    # - create new character and build nested attributes
    @character = Character.new
    @character.build_nested
    # - if user parameter exist find user
    user = params[:user_id] ? User.find_by(id: params[:user_id]) : current_user
    # - redirect if user doesnt exist
    redirect_to user_characters_path(current_user) if user.nil?
    # -  set character's user equal to user from params or new
    @character.user = user
  end

  def create
    # - Create new character from params
    @character = Character.new(character_params)
    # - set user equal to User from database or current user based on params user id
    user = params[:user_id] ? User.find_by(id: params[:user_id]) : current_user
    # - redirect if user not found
    redirect_to users_path, notice: 'User could not be found.' if user.nil?
    # set character's user equalt to user
    @character.user = user

    if @character.save
      # - if user can be saved redirect with success
      redirect_to @character, notice: "#{@character.name} has been successfully created."
    else
      # - render form if save fails
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if params[:user_id]
      @character = Character.find_by(id: params[:id], user_id: @user.id)
      (redirect_to user_characters_path(@user), notice: 'Character could not be found') if @character.nil?
    else
      @character = Character.find_by(id: params[:id])
      (redirect_to characters_path, notice: 'Character could not be found') if @character.nil?
    end
  end

  def edit
    @character = if params[:user_id]
                   Character.find_by(id: params[:id], user_id: @user.id)
                 else
                   Character.find_by(id: params[:id])
                 end

    (redirect_to user_characters_path(@user), notice: 'Character could not be found') if @character.nil?
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

  def guard_user_characters
    return unless params[:user_id] && params[:user_id] != current_user.id.to_s

    redirect_to user_characters_path(User.find_by(id: params[:user_id]))
  end

  def find_user_from_params
    return unless params[:user_id]

    @user = User.find_by(id: params[:user_id])
    (redirect_to users_path, notice: 'User could not be found.') if @user.nil?
  end
end
