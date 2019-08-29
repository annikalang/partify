class Addfilters < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :min_popularity, :integer, nil: 0, default: 0
    add_column :playlists, :max_popularity, :integer, nil: 100, default: 100
    add_column :playlists, :max_danceability, :integer, nil: 100, default: 100
    add_column :playlists, :min_danceability, :integer, nil: 0, default: 0
    add_column :playlists, :max_valence, :integer, nil: 100, default: 100
    add_column :playlists, :min_valence, :integer, nil: 0, default: 0
  end
end
