class AddColumsToTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :artist, :string
    add_column :tracks, :genre, :string
  end
end
