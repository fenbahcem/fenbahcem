class AddAttachmentDosyaToAdminDigersayfas < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_digersayfas do |t|
      t.attachment :dosya
    end
  end

  def self.down
    remove_attachment :admin_digersayfas, :dosya
  end
end
