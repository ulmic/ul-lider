class AddViewNameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :view, :text
  end
end
