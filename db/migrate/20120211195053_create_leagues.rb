class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :team_name
      t.string :user_name
      t.integer :points

      t.timestamps
    end
  end
end
