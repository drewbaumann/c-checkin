class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.belongs_to :member
      t.belongs_to :plan
      remove_column :members, :plan

      t.timestamps
    end
    add_index :memberships, [:member_id, :plan_id]
  end

  def self.down
    drop_table :memberships
    add_column :members, :plan
  end
end
