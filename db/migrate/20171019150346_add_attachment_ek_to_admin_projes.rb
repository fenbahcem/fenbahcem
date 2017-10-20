class AddAttachmentEkToAdminProjes < ActiveRecord::Migration[5.1]
  def self.up
    change_table :admin_projes do |t|
      t.attachment :ek
    end
  end

  def self.down
    remove_attachment :admin_projes, :ek
  end
end
