class AddParticipantCountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :result_participant_count, :integer
  end
end
