class AddMoreAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :municipality, :text
    add_column :users, :patronymic, :text
    add_column :users, :school, :text
    add_column :users, :group, :text
    add_column :users, :home_phone, :text
    add_column :users, :mobile_phone, :text
    add_column :users, :locality, :text
    add_column :users, :postcode, :text
  end
end
