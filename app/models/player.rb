class Player < ActiveRecord::Base

  has_many :relationships, :dependent => :destroy
  has_many :teams, :through => :relationships

  def add_to_team(player)
    Relationship.create!(:player_id=>player.id,
                         :team_id => current_user.team.first)

    redirect_to current_user
  end


end
