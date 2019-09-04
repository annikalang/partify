class RenamePartyToPartyAsGuest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :party_id, :party_as_guest_id
  end
end
