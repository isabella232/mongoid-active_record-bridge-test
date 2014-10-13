class CreateMook < ActiveRecord::Migration
  def change
    create_table :mooks do |t|
      t.string :weapon
      t.integer :hit_points
    end
  end
end
