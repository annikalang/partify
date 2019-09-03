class AddPasscodeToParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :passcode, :string
  end
end
