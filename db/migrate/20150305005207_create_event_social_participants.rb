class CreateEventSocialParticipants < ActiveRecord::Migration
  def change
    create_table :event_social_participants do |t|
      t.text :provider
      t.text :uid
      t.text :first_name
      t.text :last_name
      t.text :photo
      t.text :profile
      t.integer :event_id

      t.timestamps
    end
  end
end
