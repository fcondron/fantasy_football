ActiveAdmin.register_page "Game Admin" do
  content do
  para "Site Controls"
    ul do
      li link_to "View Site", "/"
      li link_to "Zero Team Points", zeroTeamPoints_admin_teams_path, :confirm => "are you sure?"
      li link_to "update Team Points", updateTeamPoints_admin_teams_path, :confirm => "are you sure?"
      li link_to "Zero Player Points", zeroPlayerPoints_admin_players_path, :confirm => "are you sure?"
      li link_to "update Player Points", updatePlayerPoints_admin_players_path, :confirm => "are you sure?"
      li link_to "Update Player Attributes", updateAttributes_admin_players_path
      li link_to "Create Back Players", createBackPlayer_admin_players_path
      li link_to "Create Forward Players", createForwardPlayer_admin_players_path
      li link_to "Delete Players", deletePlayers_admin_players_path
      li link_to "Create Sample Players", samplePlayer_admin_players_path
      li "Time is #{Time.now}"
    end
  end

  sidebar :game_info do
    para "Number of Users: #{User.count}"
    para "Number of Teams: #{Team.count}"
    para "Number of Leagues: #{League.count}"
    para "Number of Players: #{Player.count}"
    para "Money in play: E#{Team.count * 5}"
  end
end