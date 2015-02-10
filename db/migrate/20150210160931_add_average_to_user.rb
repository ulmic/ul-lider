class AddAverageToUser < ActiveRecord::Migration
  def change
    add_column :users, :average, :string
  end
end
