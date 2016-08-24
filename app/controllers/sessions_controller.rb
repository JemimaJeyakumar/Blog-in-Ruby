class SessionsController < ApplicationController
	skip_before_action :authorize

  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id 
  		redirect_to articles_path
  	else
  		redirect_to login_path, alert: "Invalid Username or Password"
  	end
  end


  def destroy
    session[:user_id] = nil
    flash.now[:success] = "Successfully logged out"
    redirect_to login_path
  end
end
