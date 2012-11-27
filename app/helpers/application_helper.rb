module ApplicationHelper
  def is_logged_in
    return session[:user_id]
  end
end
