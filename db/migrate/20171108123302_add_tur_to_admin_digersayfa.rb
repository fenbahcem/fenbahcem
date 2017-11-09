class AddTurToAdminDigersayfa < ActiveRecord::Migration[5.1]
  def change
    add_column :admin_digersayfas, :tur, :integer
  end
end
