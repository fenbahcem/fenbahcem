class AddUniteIdToAdminMateryal < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_materyals, :unite_id, :integer
  end
end
