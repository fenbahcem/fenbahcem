class AddSinifToAdminUnite < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_unites, :sinif, :integer
  end
end
