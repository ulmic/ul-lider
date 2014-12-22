class AddDefaultToUserState < ActiveRecord::Migration
  def change
    change_column_default :users, :state, :waiting_confirmation
  end
end
