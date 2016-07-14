class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		   if user && user.authenticate(params[:password])
		        session[:user_id] = user.id
		        redirect_to root_path, :notice => "Welcome back, #{user.email}"   
		   else
		        flash[:alert] = "Invalid email or password"
		        redirect_to :back  
		   end
	end


	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've been logged out successfully."
		redirect_to "/"
	end
end
