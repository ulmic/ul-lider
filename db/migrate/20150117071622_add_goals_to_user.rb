class AddGoalsToUser < ActiveRecord::Migration
  def change
    add_column :users, :life_goals, :text
    add_column :users, :fair_goals, :text
  end
end
