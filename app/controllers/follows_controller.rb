class FollowsController < ApplicationController
	def index
		@follows = Follow.all
	end

  def create
	@user = current_user
	@boat = Boat.find(params[:id])
	@boat_id = params[:boat_id]
	@follow = Follow.new(user_id: current_user.id, boat_id: @boat.id)
	flash[:notice] = 'Following.' if @follow.save
	respond_to do |format|
  		format.js 
  	end
  end

  def destroy
	@user = current_user
	@follow=Follow.where(user_id: current_user.id, boat_id:params[:id]).first
	@follow.destroy
    respond_to do |format|
      	format.js 
  	end
  end

  def follow_params
	params.require(:follow).permit(:user_id, :boat_id)
  end
end

