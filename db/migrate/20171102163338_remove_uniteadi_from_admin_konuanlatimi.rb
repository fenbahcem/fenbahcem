class RemoveUniteadiFromAdminKonuanlatimi < ActiveRecord::Migration[5.1]
  def change
    remove_column :admin_konuanlatimis, :uniteadi, :string
  end
end
