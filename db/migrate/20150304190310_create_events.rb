class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :description
      t.datetime :begin_date
      t.datetime :end_date
      t.text :place

      t.timestamps
    end
  end
end
