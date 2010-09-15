class AddExtraDayCostToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :extra_day_price, :integer
  end

  def self.down
    remove_column :plans, :extra_day_price
  end
end
