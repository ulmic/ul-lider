class AddRegionToUser < ActiveRecord::Migration
  def change
    add_column :users, :region, :text, default: 'Ульяновская область'
  end
end
