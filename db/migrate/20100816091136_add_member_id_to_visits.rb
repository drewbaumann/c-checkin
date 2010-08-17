class AddMemberIdToVisits < ActiveRecord::Migration
  def self.up
    add_column :visits, :member_id, :integer
  end

  def self.down
    remove_column :visits, :member_id, :integer
  end
end
