class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to :back
      end
  end


  def edit
  end

  def delete
  end

  def destroy
  end

  def post
  end
end
