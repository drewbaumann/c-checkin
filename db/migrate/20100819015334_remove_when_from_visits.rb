class RemoveWhenFromVisits < ActiveRecord::Migration
  def self.up
    remove_column :visits, :when, :datetime
  end

  def self.down
    add_column :visits, :when, :datetime
  end
end
