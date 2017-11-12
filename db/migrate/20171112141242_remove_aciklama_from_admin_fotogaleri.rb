class RemoveAciklamaFromAdminFotogaleri < ActiveRecord::Migration[5.1]
  def change
    remove_column :admin_fotogaleris, :aciklama, :text
  end
end
