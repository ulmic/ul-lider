class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :password_digest
      t.string :email
      t.datetime :birth_date
      t.string :confirmation_token
      t.string :reset_password_token
      t.string :state

      t.timestamps
    end
  end
end
