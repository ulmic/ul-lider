class AddLinkToCreateWorkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :creative_work_url, :text
  end
end
