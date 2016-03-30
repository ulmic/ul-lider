class AddAttributesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :mass_media, :text
    add_column :events, :partners, :text
    add_column :events, :quality, :text
    add_column :events, :idea, :text
  end
end
