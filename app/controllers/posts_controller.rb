class PostsController < ApplicationController
  before_filter :confirm_logged_in
  respond_to :json, :html

  def index
    if params[:archived]
      @posts = Post.find_all_by_archived(true, :order => 'created_at DESC')
    else
      @posts = Post.find_all_by_archived(false, :order => 'created_at DESC')
    end
    render "post/index"
  end

  def destroy
    @post = Post.destroy(params[:id])
    render "post/show"    
  end

  def show
    @post = Post.find(params[:id])
    render "post/show"
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

end
