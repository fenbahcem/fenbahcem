class AddSayacToAdminMateryal < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_materyals, :sayac, :integer
  end
end
