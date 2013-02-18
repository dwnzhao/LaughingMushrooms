class CommentsController < ApplicationController
  before_filter :confirm_logged_in
  respond_to :json, :html

  def create
    c = Comment.new(:content => params[:comment])
    c.author_id = session[:user_id]
    c.post_id = params[:post_id]
    c.author_name = User.find_by_id(session[:user_id]).first_name
    c.save
    render json: c
  end

end
