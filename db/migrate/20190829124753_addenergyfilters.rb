class Addenergyfilters < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :min_energy, :integer, nil: 0, default: 0
    add_column :playlists, :max_energy, :integer, nil: 100, default: 100
  end
end
