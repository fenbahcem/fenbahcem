class RemoveUniteadiFromAdminMateryal < ActiveRecord::Migration[5.1]
  def change
    remove_column :admin_materyals, :uniteadi, :string
  end
end
