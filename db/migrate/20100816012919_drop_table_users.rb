class DropTableUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
  end
end
