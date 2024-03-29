class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :author
      t.string :description
      t.string :headline
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
