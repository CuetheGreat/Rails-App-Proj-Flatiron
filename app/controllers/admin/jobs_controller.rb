module Admin
  class JobsController < ApplicationController
    before_action :set_job, only: %i[show edit]
    before_action :admin?

    def index
      @jobs = Job.all
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)

      if @job.save
        flash[:notice] = 'Job created successfully.'
        redirect_to admin_job_path(@job)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit; end

    def update
      @job = Job.find_by(params[:id])
      if @job.update(job_params)
        flash[:notice] = 'Job updated successfully.'
        redirect_to admin_job_path(@job)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def delete
      @job = Job.find_by(id: params[:id])
      binding.pry
      flash[:notice] = 'Job successfully destroyed.'
      @job.destroy

      reditect_to admin_jobs_path
    end

    private

    def job_params
      params.require(:job).permit(:name)
    end

    def set_job
      @job = Job.find_by(params[:id])
    end
  end
end
