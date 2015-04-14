class CreateEventParticipants < ActiveRecord::Migration
  def change
    create_table :event_participants do |t|
      t.integer :event_id
      t.text :first_name
      t.text :last_name
      t.text :phone

      t.timestamps
    end
  end
end
