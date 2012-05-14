class Relationship < ActiveRecord::Base
  attr_accessible :team_id, :player_id

  belongs_to :team
  belongs_to :player


  validates :player_id, :presence => true
  validates :team_id, :presence => true

end
