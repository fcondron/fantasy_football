class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string  :name
      t.string  :club
      t.integer :goals
      t.integer :assists
      t.integer :yellow_cards
      t.integer :red_cards
      t.string  :position
      t.integer :points
      t.integer :played
      t.integer :clean_sheet
      t.integer :three_shots_saved
      t.integer :penalty_save
      t.integer :penalty_miss
      t.integer :own_goals


      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
