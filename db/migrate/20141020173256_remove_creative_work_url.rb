class RemoveCreativeWorkUrl < ActiveRecord::Migration
  def change
    remove_column :users, :creative_work_url
    add_column :users, :url_creative_work, :text
  end
end
