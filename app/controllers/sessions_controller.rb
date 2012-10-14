class SessionsController < ApplicationController
  
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  
  def login
    #Login Form
  end

  def login_attempt
          authenticated_user = User.authenticate(params[:email],params[:login_password])
          if authenticated_user
            session[:user_id] = authenticated_user.id
            flash[:notice] = "You logged in as #{authenticated_user.email}"
            redirect_to(:action => 'home')
          else
            flash[:notice] = "Invalid Username or Password"
            flash[:color]= "invalid"
            render "login"  
          end
        end

  def home
    #Home Page
  end

  def profile
    #Profile Page
  end

  def setting
    #Settings Page
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
