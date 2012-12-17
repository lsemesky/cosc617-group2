class ApplicationController < ActionController::Base
  helper :all 
  protect_from_forgery
  
  protected
  def authenticate_user
    unless session[:user_id] #if user isn't signed in
      redirect_to(:controller => 'sessions', :action => 'login') #go to login page
      return false
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id] 
      return true
    end
  end

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
            redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end
  
  def is_admin
    if session[:user_id].admin
        return true
    else
      redirect_to(:controller => 'sessions', :action => 'home')
      return false
    end
  end
end
