class ApplicationController < ActionController::Base

  # before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#Should login before access the application  
  before_action :authorize 
  protected
  helper_method :current_user, :logged_in?

  def current_user
      @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

#If require user is not logged in then pop-up this message 
#Lead to the login page
  def require_user 
    if !logged_in?
      flash[:danger] = "You must be logged in to perform the action"
      redirect_to login_path 
    
  end

end


  # def authenticate_user!
  #   # if user.logged_in?
  #   if
      
  #   end
  #     super
  #   else
  #     redirect_to login_path
      
  #   end
    
  # end

  def authorize
  	unless  User.find_by(id: session[:user_id])
  		# redirect_to login_url, notice:"You trying to access without permit"
  	end
  		
  	end

  #pop-up the message danger without login to the page


def logged_in_user
    unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end

end
