class RemoveKisiFromAdminProje < ActiveRecord::Migration[5.1]
  def change
    remove_column :admin_projes, :kisi, :text
  end
end
