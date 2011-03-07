class AddImageToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :avatar, :string
  end

  def self.down
    remove_column :projects, :avatar
  end
end
