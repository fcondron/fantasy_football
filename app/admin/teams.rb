ActiveAdmin.register Team do
  menu :label => "Teams", :parent => "Game Admin"

  collection_action :zeroTeamPoints, :method => :get do
    @teams=Team.all
    @teams.each do |team|
      team.update_attributes(:points => 0)
    end
    redirect_to admin_teams_path, :notice => "TEAM POINTS SET TO 0!"
  end

  collection_action :updateTeamPoints, :method => :get do
    @teams=Team.all
    @teams.each do |team|
      team_points=0
      team.players.each do |player|
        team_points+=player.points
      end
      team.update_attributes(:points => team_points)
    end
    redirect_to admin_teams_path, :notice => "TEAM POINTS SET!"
  end


  index do
    column :name
    column :user_id
    column :points
  default_actions
  end
end
