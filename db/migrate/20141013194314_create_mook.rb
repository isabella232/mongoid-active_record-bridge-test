class CreateMook < ActiveRecord::Migration
  def change
    create_table :mooks do |t|
      t.string :weapon
      t.integer :hit_points
      t.string :boss_id
    end
  end
end
