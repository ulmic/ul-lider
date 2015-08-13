class CreateClubParticipants < ActiveRecord::Migration
  def change
    create_table :club_participants do |t|
      t.text :first_name
      t.text :last_name
      t.text :patronymic
      t.text :phone
      t.text :email
      t.text :past_participation
      t.datetime :birth_date

      t.timestamps
    end
  end
end
