class JobsController < ApplicationController
  def new
  end

  def create
  		@boat = Boat.find(params[:boat_id])
		@job = @boat.jobs.create(job_params)
		if @job.save
			redirect_to boat_path(@boat)
		else
			flash[:notice] = "Invalid job."
			redirect_to boat_path(@boat)
		end
  end

  def edit
  end

  def destroy
  end

  private

	def job_params
		params.require(:job).permit(:name, :container, :cargo, :origin, :cost, :destination, :boat_id)
	end
end

