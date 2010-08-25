class AddColoftIdToVisit < ActiveRecord::Migration
  def self.up
    add_column :visits, :coloft_id, :integer
  end

  def self.down
    remove_column :visits, :coloft_id, :integer
  end
end
