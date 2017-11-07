class CreateOgrencicalismas < ActiveRecord::Migration[5.1]
  def change
    create_table :ogrencicalismas do |t|
      t.string :ad
      t.string :soyad
      t.string :email
      t.text :aciklama

      t.timestamps
    end
  end
end
