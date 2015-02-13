class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate params[:email], params[:password]
    	if farmer
      	session[:user_id] = user.id
      	redirect_to root_path, :notice => "Welcome back to Shop Ketti"
    	else
      	redirect_to :login, :alert => "Invalid email or password"
   	 end
	end

	def destroy
  		session[:user_id] = nil
  		redirect_to root_path :notice => "You have been logged out"
	end
end
