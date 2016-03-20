class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :goal, index: true
      t.references :user, index: true
      t.integer :current_day
      t.string :days_completed

      t.timestamps
    end
  end
end
