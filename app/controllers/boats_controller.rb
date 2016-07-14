class BoatsController < ApplicationController
  def index
  end

  def new
    @boat = Boat.new
  end

  def create
    @user = User.find(session[:user_id])
    # define comment with the params we created
    @boat = @user.boats.create(boat_params)
    redirect_to "/"
  end

  def show
  end

  def edit
  end

  def delete
  end

  def destroy
  end

  private 
    def boat_params
      params.require(:boat).permit(:name, :capacity, :location)
    end
end



  