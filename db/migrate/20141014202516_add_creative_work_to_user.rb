class AddCreativeWorkToUser < ActiveRecord::Migration
  def change
    add_column :users, :creative_work, :text
  end
end
