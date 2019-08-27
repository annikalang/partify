class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :display_name, :string
    add_column :users, :spotify_id, :string
    add_column :users, :image, :string
  end
end
