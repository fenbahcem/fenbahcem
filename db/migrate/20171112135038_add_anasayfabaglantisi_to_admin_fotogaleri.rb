class AddAnasayfabaglantisiToAdminFotogaleri < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_fotogaleris, :anasayfabaglantisi, :boolean
  end
end
