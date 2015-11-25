class CreatePromocodes < ActiveRecord::Migration
  def change
    create_table :promocodes do |t|
      t.text :code
      t.text :email

      t.timestamps
    end
  end
end
