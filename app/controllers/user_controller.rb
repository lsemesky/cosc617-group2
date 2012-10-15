class UserController < ApplicationController
  
  before_filter :save_login_state, :only => [:register, :add]

  def register
    @user = User.new
    
  end

  def add
    @user= User.new(params[:user])
    if (@user.save)
      flash[:notice] = "Your registration was successful"
      flash[:color] = "valid"
      redirect_to :controller=>'sessions', :action => 'login'
    else
      flash[:notice]="Error saving, try again"
      flash[:color]= "invalid"
      render "register"
    end
    
  end
  
  def tos
    
  end
  

end
