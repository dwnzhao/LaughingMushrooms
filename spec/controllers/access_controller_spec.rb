require 'spec_helper'

describe AccessController, "user" do
  render_views
    
  it "should be redirected to home on successful save" do
    User.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(home_path)
  end

  it "should see signup on failed save" do
    User.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template("signup")
  end
  
  it "should be redirected to home on successful authentication" do
    User.create!(email: "dwnzhao@gmail.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")
    post :authenticate, email: "dwnzhao@gmail.com", password: "mushrooms"
    response.should redirect_to(home_path)
  end
  
  it "should see login on failed authentication" do
    User.create!(email: "dwnzhao@gmail.com", password: "mushrooms", first_name: "dawn", last_name: "zhao")
    post :authenticate, email: "dwnzhao@gmail.com", password: "mushroom"
    flash[:warning].should_not be_nil
    response.should render_template("login")
  end
  
end