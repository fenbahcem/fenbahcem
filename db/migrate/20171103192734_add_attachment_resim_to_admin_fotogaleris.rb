class AddAttachmentResimToAdminFotogaleris < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_fotogaleris do |t|
      t.attachment :resim
    end
  end

  def self.down
    remove_attachment :admin_fotogaleris, :resim
  end
end
