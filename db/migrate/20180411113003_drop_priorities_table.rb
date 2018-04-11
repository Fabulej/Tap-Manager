class DropPrioritiesTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :priorities
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
