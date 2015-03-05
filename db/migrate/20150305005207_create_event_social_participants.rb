class CreateEventSocialParticipants < ActiveRecord::Migration
  def change
    create_table :event_social_participants do |t|
      t.text :provider
      t.text :uid
      t.integer :event_id

      t.timestamps
    end
  end
end
