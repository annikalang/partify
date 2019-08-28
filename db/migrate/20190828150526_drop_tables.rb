class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :artists
    drop_table :playlist_tracks
  end
end
