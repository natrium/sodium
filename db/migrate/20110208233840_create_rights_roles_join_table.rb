class CreateRightsRolesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :rights_roles, :id => false do |t|
      t.integer :right_id
      t.integer :role_id
    end

    add_index :rights_roles, [:right_id, :role_id], :unique => true
  end

  def self.down
    drop_table :rights_roles
  end
end
