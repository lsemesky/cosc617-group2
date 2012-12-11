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
    @user = User.find session[:user_id]
    @zoo = @user.zoo
    
    @animals = @user.animals
    
    @species = @animals.group_by {|animal| animal.animal_type}
  end

  def profile
   #Profile page
  end
  
  def edit
    @user = User.find session[:user_id] 
  end

  def setting
    #Settings Page
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "You are now logged out"
    redirect_to :action => 'login'
  end
end
