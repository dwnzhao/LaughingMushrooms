class OrganizeController < ApplicationController
  before_filter :confirm_logged_in
  respond_to :json, :html
  
  def index
    respond_with Post.all
  end
  
  def destroy
    respond_with Post.destroy(params[:id])
  end
  
  
end
