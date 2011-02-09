class CreateRights < ActiveRecord::Migration
  def self.up
    create_table :rights do |t|
      t.string :name

      t.timestamps
    end

    add_index :rights, :name, :unique => true
  end

  def self.down
    drop_table :rights
  end
end
