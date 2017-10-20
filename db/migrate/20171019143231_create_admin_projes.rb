class CreateAdminProjes < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_projes do |t|
      t.string :projeadi
      t.text :projeaciklama
      t.text :kisi
      t.text :kavram
      t.text :nasil
      t.text :sonuc

      t.timestamps
    end
  end
end
