class DropAdminKonuanlatimisTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :admin_konuanlatimis
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
