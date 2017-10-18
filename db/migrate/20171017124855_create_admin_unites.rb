class CreateAdminUnites < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_unites do |t|
      t.string :uniteadi
      t.text :aciklama

      t.timestamps
    end
  end
end
