class AddReportsAttributesToEventTable < ActiveRecord::Migration
  def change
    add_column :events, :results, :text
    add_column :events, :type, :text
    add_column :events, :file, :text
  end
end
