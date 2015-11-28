class AddContestYearToUser < ActiveRecord::Migration
  def change
    add_column :users, :contest_year, :integer
  end
end
