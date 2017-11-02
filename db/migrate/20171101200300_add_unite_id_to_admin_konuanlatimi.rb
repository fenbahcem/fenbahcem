class AddUniteIdToAdminKonuanlatimi < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_konuanlatimis, :unite_id, :integer
  end
end
