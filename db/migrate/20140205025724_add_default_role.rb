class AddDefaultRole < ActiveRecord::Migration
  def change
      change_column :roles, :description, :string, :default => "client"
  end
end
