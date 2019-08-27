class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :duration_ms
      t.string :image
      t.float :danceability
      t.float :tempo
      t.float :energy
      t.float :valence
      t.integer :popularity
      t.string :spotify_id
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
