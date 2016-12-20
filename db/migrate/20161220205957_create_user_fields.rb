class CreateUserFields < ActiveRecord::Migration
  def change
    create_table :user_fields do |t|
      t.text :title
      t.integer :user_id
      t.text :value

      t.timestamps null: false
    end
  end
end
