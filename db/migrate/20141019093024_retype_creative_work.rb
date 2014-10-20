class RetypeCreativeWork < ActiveRecord::Migration
  def change
    remove_column :users, :creative_work
    add_column :users, :creative_work, :string
  end
end
