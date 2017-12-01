class AddAttachmentDosyaToAdminGeneldosyas < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_geneldosyas do |t|
      t.attachment :dosya
    end
  end

  def self.down
    remove_attachment :admin_geneldosyas, :dosya
  end
end
