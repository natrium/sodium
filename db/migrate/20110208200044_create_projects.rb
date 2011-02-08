class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :desc
      t.string :url
      t.string :slug
      t.integer :user_id

      t.timestamps


      add_index :projects, :name,                 :unique => true
      add_index :projects, :slug,                 :unique => true
    end
  end

  def self.down
    drop_table :projects
  end
end
