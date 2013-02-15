class PostsController < ApplicationController
  before_filter :confirm_logged_in
  respond_to :json, :html

  def index
    if params[:archived]
      respond_with Post.find_all_by_archived("true")
    else
      respond_with Post.find_all_by_archived("false")
    end
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end

  def show
    respond_with Post.find(params[:id])
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

end
