class AccessController < ApplicationController

  def index
    redirect_to(:action => 'login')
  end

  def profile
    @user = User.find_by_id(session[:user_id])
    render(:template => 'access/signup')
  end

  def login
    if (session[:user_id])
      redirect_to(home_path)
    end
  end

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
    if !User.find_by_email(params[:email]).present?
      flash.now[:warning] = "We could not find an account with #{params[:email]}. <a href='/signup'>sign up?</a>".html_safe
      render("login")
    else
      authorized_user = User.authorize(params[:email], params[:password])
      if authorized_user
        session[:user_id] = authorized_user.id
        redirect_to(home_path)
      else
        flash.now[:warning] = "Invalid email / password combination"
        render("login")
      end
    end
  end

  def logout      
    session[:user_id] = nil
    redirect_to(login_path)
  end


end
