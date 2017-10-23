class CreateAdminMateryals < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_materyals do |t|
      t.integer :sinif
      t.string :uniteadi
      t.integer :materyaltur
      t.string :materyaladi
      t.text :materyalaciklama

      t.timestamps
    end
  end
end
