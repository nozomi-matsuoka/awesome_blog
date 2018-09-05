class SessionsController < ApplicationController

  def new
  end

  def create
	user = 	User.find_by(email: params[:session][:email])
	
	if  user && user.authenticate(params[:session][:password])
		session[:user_id] = user.id

		flash[:success] = "Hurray! Successfully logged in!"
		redirect_to user_url(user)
	else
		flash.now[:notice] = "Invalid information."
	  	render "new"
	end
  end

  def destroy
	session.destroy
	flash[:notice] = "Logged out."
	render "new"
end
end
