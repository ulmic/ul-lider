class AddPhotoAndVideoLinkToReport < ActiveRecord::Migration
  def change
    add_column :events, :photo, :text
    add_column :events, :video, :text
  end
end
