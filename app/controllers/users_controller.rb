class UsersController < ApplicationController
  def index 
    @user = User.find(session[:user_id])
    @boats = @user.boats.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      # redirect_to :back
      redirect_to "/users/new"
    end
  end

  def newboat
  end

  def createboat
  end

  def edit
  end

  def delete
  end

  def destroy
  end

  def post
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end



  

  
