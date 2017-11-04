class CreateAdminVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_videos do |t|
      t.string :baslik
      t.string :videolink
      t.integer :tur

      t.timestamps
    end
  end
end
