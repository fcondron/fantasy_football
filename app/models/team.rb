class Team < ActiveRecord::Base
  attr_accessible :name, :points, :player_ids, :relationship_id, :league_id

  belongs_to :user
  belongs_to :league

  has_many :relationships, :dependent => :destroy
  has_many :players, :through => :relationships


  validates :user_id, :presence => true
  validates :name, :presence => true, :uniqueness => true

end
