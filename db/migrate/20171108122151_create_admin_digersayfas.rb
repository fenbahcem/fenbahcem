class CreateAdminDigersayfas < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_digersayfas do |t|
      t.string :baslik
      t.text :metin

      t.timestamps
    end
  end
end
