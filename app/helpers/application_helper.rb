module ApplicationHelper
  def is_logged_in?
    return session[:user_id]
  end
  
  def current_user
    return User.find( session[:user_id])
  end
  
  def is_admin?
   if User.find( session[:user_id])
    return User.find( session[:user_id]).admin
    else
      return false
  end
  end
end
