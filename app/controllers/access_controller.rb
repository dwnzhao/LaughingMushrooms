class AccessController < ApplicationController

  def signup
    if (session[:user_id])
      flash[:warning] = "... please first log out ..."
      redirect_to(home_path)
    else 
      @user = User.new
    end      
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to(home_path)
    else
      render("access/signup")
    end
  end
  
  def authenticate
    authorized_user = User.authenticate(params[:email], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to(home_path)
    else
      flash[:warning] = "Invalid email / password combination"
      render("login")
    end
  end
  
  def logout      
    session[:user_id] = nil
    redirect_to(login_path)
  end


end
