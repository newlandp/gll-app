class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :goal, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
