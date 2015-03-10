class AddGoalAndParticipantCount < ActiveRecord::Migration
  def change
    add_column :events, :goal, :text
    add_column :events, :participant_count, :text
  end
end
