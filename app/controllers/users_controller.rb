class UsersController < ApplicationController
  
  before_filter :save_login_state, :only => [:register, :add]

  def register
    @user = User.new(params[:user])
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
  
  def show
    
    @user = User.find session[:user_id] 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @animal }
    
  end
   
    #redirect_to profile_path
  end
  
    def edit
    @user = User.find session[:user_id] 
  end
  
  def update
    @user = User.find session[:user_id] 
    
    respond_to do |format|
      if @user.update_attributes(params[:user_id])
        format.html { redirect_to @user,
          notice: 'user profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
    end
  

end
