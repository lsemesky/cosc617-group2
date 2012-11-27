module UserHelper
  def is_current_user
    return (params[:id] == session[:user_id]) || !params[:id]
  end
end
