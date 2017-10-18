class AddAttachmentDosyaToAdminKonuanlatimis < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_konuanlatimis do |t|
      t.attachment :dosya
    end
  end

  def self.down
    remove_attachment :admin_konuanlatimis, :dosya
  end
end
