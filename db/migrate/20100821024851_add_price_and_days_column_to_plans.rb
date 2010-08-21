class AddPriceAndDaysColumnToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :days, :integer
    add_column :plans, :price, :integer
  end

  def self.down
    remove_column :plans, :days, :integer
    remove_column :plans, :price, :integer
  end
end
