class UsersController < ApplicationController
  
  before_filter :save_login_state, :only => [:register, :add]
  #before_filter :signed_in_user, only: [:edit, :update]
  #before_filter :correct_user,   only: [:edit, :update]
  
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
   if params[:id] 
      @user = User.find params[:id]
    else
      @user = User.find session[:user_id]
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }  
    end
  end
  
  def edit
    @user = User.find session[:user_id] 
    if request.post?
    if params[:user][:password].empty?
      # password not edited
      params[:user][:password] = @user.password
      params[:user][:password_confirmation] = @user.password
    else
      # password edited
      if params[:user][:current_password] != @user.password
        @user.errors.add(:current_password, "is incorrect")
        return
      end
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your details have been updated"
      redirect_to :action => :index
    end
  end
  @user.password = nil
  @user.password_confirmation = nil
  end
  
  def update
    @user = User.find session[:user_id] 
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
  end
  
  def create
    @user = User.find session[:user_id] 
  end
  
  def index
    @users = User.paginate(:per_page => 3, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def follow
    @users = User.all
  end
  
  def unfollow
    @users = User.all
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
