class CreateAdminGeneldosyas < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_geneldosyas do |t|
      t.string :baslik
      t.integer :sinif

      t.timestamps
    end
  end
end
