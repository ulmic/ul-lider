class AddMoreAttributesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pluses, :text
    add_column :events, :minuses, :text
    add_column :events, :most_liked, :text
    add_column :events, :can_change, :text
    add_column :events, :work_with_command, :text
    add_column :events, :resources, :text
  end
end
