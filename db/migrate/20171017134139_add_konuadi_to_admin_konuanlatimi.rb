class AddKonuadiToAdminKonuanlatimi < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_konuanlatimis, :konuadi, :string
  end
end
