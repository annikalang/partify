class AddPhotoToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :photo, :string
  end
end
