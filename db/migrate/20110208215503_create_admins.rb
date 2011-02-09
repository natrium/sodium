class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
