class CreateAdminKonuanlatimis < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_konuanlatimis do |t|
      t.integer :sinif
      t.string :uniteadi
      t.string :kavram
      t.text :metin

      t.timestamps
    end
  end
end
