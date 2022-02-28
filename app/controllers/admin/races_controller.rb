module Admin
  class RacesController < ApplicationController
    before_action :set_race, only: %i[show edit destroy]
    before_action :admin?

    def index
      @races = Race.all
    end

    def new
      @race = Race.new
      2.times do
        @race.benefits.build
      end
    end

    def create
      @race = Race.new(race_params)

      if @race.save
        flash[:notice] = 'Race created successfully.'
        redirect_to admin_race_path(@race)
      else
        2.times do
          @race.benefits.build
        end
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit; end

    def update
      @race = Race.find_by(params[:id])
      if @race.update(race_params)
        flash[:notice] = 'Race updated successfully.'
        redirect_to admin_race_path(@race)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def race_params
      params.require(:race).permit(:name, benefits_attributes: [])
    end

    def set_race
      @race = Race.find_by(id: params[:id])
    end
  end
end
