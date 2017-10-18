class AddAttachmentUniteresmiToAdminUnites < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_unites do |t|
      t.attachment :uniteresmi
    end
  end

  def self.down
    remove_attachment :admin_unites, :uniteresmi
  end
end
