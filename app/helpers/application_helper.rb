module ApplicationHelper
  
  def user
    return User.find(session[:user_id])
  end
end
