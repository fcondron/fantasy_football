class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction
  attr_accessor

  def show
    @player = Player.find(params[:id])
    @title = @player.name.capitalize
  end

  def index
    @title = "Player's List"
    @players = Player.order(sort_column + " " + sort_direction).page(params[:page])
  end

  def edit
    redirect_to root_path
  end

  def add_to_team(player)
    Relationship.create!(:player_id=>player.id,
                         :team_id => current_user.team.first)
    redirect_to root_path
  end

  def sort_column
    Player.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
