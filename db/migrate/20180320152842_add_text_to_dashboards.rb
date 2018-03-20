class AddTextToDashboards < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboards, :text, :text
  end
end
