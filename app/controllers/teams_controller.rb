class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, :only => [:edit, :update, :destroy, :show]


  def index
    @title = current_user.username.capitalize + "'s list of teams'"
    if !current_user.teams.empty?
      @teams = current_user.teams
    else 
      redirect_to root_path
    end
  end

  def edit
    @team = Team.find(params[:id])
    @title = @team.name
    @players=Player.all
  end

  def show
    @team = Team.find(params[:id])
    @title = @team.name
    @players = @team.players
    @league = League.find(:all, :conditions => {:id => @team.league_id})
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      flash[:success] = "Profile updated."
      redirect_to teams_path
    else
      @title = @team.name
      render 'edit'
    end
  end

  def create
    @team = current_user.teams.build(params[:team])
    if @team.save
      flash[:success] = "Team created!"
      redirect_to teams_path
    else
      flash[:error] = "Error Creating Team"
      redirect_to teams_path
    end
  end

  def new
     @team = current_user.teams.build(params[:team])
      flash[:success] = "Team created!"
     @leagues=League.all
  end

  def current_user?(user)
  user == current_user
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  def authenticate
      deny_access unless signed_in?
  end

   def correct_user
     @team = Team.find(params[:id])
     @user = current_user
      if @team.user_id==@user.id then @user=current_user
      else
       redirect_to(teams_path)
      end
   end



   private

    def authorized_user
      @team = current_user.teams.find_by_id(params[:id])
      redirect_to root_path if @team.nil?
    end

end