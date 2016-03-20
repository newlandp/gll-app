class AddFieldsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :current_day, :integer
    add_column :tracks, :days_completed, :array
  end
end
