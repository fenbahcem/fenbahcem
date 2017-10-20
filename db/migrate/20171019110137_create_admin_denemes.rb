class CreateAdminDenemes < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_denemes do |t|
      t.integer :sinif
      t.string :uniteadi
      t.string :denemeadi
      t.text :aciklama

      t.timestamps
    end
  end
end
