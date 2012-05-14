class UsersController < ApplicationController
   before_filter :authenticate_user!, :only => [:edit, :show, :update, :destroy, :show, :index]
   before_filter :correct_user, :only => [:edit, :update, :destroy]

  def index
    @title = "All users"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @teams = @user.teams
    @title = @user.username
  end

  def edit
    redirect_to root_path
  end

  def authenticate
      deny_access unless signed_in?
  end

   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
   end

    def current_user?(user)
    user == current_user
    end

   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to root_path
   end

   def admin_user
      redirect_to(teams_path)
   end
end
