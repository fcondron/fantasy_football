class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :team_id
      t.integer :player_id

      t.timestamps
    end
    add_index :relationships, :player_id
    add_index :relationships, :team_id
    add_index :relationships, [:player_id, :team_id], :unique => true
  end

  def self.down
    drop_table :relationships
  end
end
