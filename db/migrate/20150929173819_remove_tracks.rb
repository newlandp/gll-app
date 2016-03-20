class RemoveTracks < ActiveRecord::Migration
  def up
    drop_table :tracks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
