class AddAttachmentDosyaToAdminMateryals < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_materyals do |t|
      t.attachment :dosya
    end
  end

  def self.down
    remove_attachment :admin_materyals, :dosya
  end
end
