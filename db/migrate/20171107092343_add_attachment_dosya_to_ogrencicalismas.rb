class AddAttachmentDosyaToOgrencicalismas < ActiveRecord::Migration[5.1]
  def self.up
    change_table :ogrencicalismas do |t|
      t.attachment :dosya
    end
  end

  def self.down
    remove_attachment :ogrencicalismas, :dosya
  end
end
