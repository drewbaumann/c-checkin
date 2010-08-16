class CreatePlansTable < ActiveRecord::Migration
  def self.up
    create_table "plans", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name"
    end
  end

  def self.down
  end
end
