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
    if @user.save
      flash[:notice] = "yar you made a boat matey!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your boat. Please try again matey."
      redirect_to "/boats/new"
    end
  end

  def show
    @user = current_user
    @boat = Boat.find(params[:id])
    @follow = Follow.new
    @following = Follow.where(:user_id => current_user.id, :boat_id => @boat.id).first
  end

  def edit
  end

  def delete
    @follow=Follow.where(user_id:params[:user_id], boat_id:params[:boat_id]).first
    @follow.destroy
  end

  def destroy
    @follow=Follow.where(user_id:params[:user_id], boat_id:params[:boat_id]).first
    @follow.destroy
  end

  private 
    def boat_params
      params.require(:boat).permit(:name, :capacity, :location, :avatar)
    end
end



  