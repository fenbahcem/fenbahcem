class CreateAdminFotogaleris < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_fotogaleris do |t|
      t.string :baslik
      t.text :aciklama

      t.timestamps
    end
  end
end
