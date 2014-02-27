class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, before: :created_at
    add_index :users, :username, unique: true
  end
end
