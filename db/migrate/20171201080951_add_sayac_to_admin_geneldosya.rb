class AddSayacToAdminGeneldosya < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_geneldosyas, :sayac, :integer
  end
end
