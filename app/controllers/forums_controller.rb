class ForumsController < ApplicationController
  before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]

  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
    @forum = Forum.new
  end
  
  def create
    @forum = Forum.new(params[:forum])
    
    if @forum.save
      flash[:notice] = "Forum was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    
    if @forum.update_attributes(params[:forum])
      flash[:notice] = "Forum was updated successfully."
      redirect_to forum_url(@forum)
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    
    if @forum.destroy
      flash[:notice] = "Category was deleted."
      redirect_to forums_url
    end
  end

  def admin_user
  if current_user.forem_admin == true
    flash[:notice] = "You do not have permissions to access."
    else redirect_to(forum_path)
  end
  end
end