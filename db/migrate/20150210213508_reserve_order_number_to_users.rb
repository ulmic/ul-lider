class ReserveOrderNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reserve_order_number, :integer
  end
end
