class AddProjectIdToBubbles < ActiveRecord::Migration
  def self.up
    add_column :bubbles, :project_id, :integer, :default => nil
  end

  def self.down
    remove_column :bubbles, :project_id
  end
end
