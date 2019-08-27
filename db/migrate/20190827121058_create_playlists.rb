class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.float :danceability
      t.float :tempo
      t.float :energy
      t.float :valence
      t.integer :popularity
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
