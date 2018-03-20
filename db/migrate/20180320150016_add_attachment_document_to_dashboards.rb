class AddAttachmentDocumentToDashboards < ActiveRecord::Migration[5.1]
  def self.up
    change_table :dashboards do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :dashboards, :document
  end
end
