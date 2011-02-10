class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships, :id => false do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :role_id
    end

    add_index :memberships, [:user_id, :project_id], :unique => true
  end

  def self.down
  end
end
