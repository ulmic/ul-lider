class AddContestYearToEvents < ActiveRecord::Migration
  def change
    add_column :events, :contest_year, :integer
  end
end
