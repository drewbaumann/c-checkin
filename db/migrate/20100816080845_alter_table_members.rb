class AlterTableMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :coloft_id,    :integer

  end

  def self.down
    remove_column :members, :coloft_id,    :integer

  end
end
