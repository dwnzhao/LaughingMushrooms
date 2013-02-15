class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def confirm_logged_in
    unless session[:user_id]
      flash.now[:warning] = "Please log in or sign up."
      render('/access/login')
      return false
    else 
      return true
    end
  end
end
