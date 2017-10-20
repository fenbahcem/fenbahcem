class AddAttachmentDosyaToAdminDenemes < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_denemes do |t|
      t.attachment :dosya
    end
  end

  def self.down
    remove_attachment :admin_denemes, :dosya
  end
end
