class AddRawDataToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :raw_data, :json
  end
end
