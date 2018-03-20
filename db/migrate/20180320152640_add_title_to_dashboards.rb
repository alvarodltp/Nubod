class AddTitleToDashboards < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboards, :title, :string
  end
end
