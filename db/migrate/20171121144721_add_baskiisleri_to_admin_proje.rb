class AddBaskiisleriToAdminProje < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_projes, :baskiisleri, :text
  end
end
