class CreateAdminDuyurus < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_duyurus do |t|
      t.text :aciklama
      t.integer :tur

      t.timestamps
    end
  end
end
