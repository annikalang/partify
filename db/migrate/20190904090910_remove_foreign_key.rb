class RemoveForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, column: :party_as_guest_id
  end
end
