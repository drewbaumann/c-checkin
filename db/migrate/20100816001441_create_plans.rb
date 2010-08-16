class CreatePlans < ActiveRecord::Migration
  def self.up
    alter_table :plans do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
