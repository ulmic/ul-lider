class AddJuriToEvents < ActiveRecord::Migration
  def change
    add_column :events, :jury, :text
    add_column :events, :tasks, :text
  end
end
