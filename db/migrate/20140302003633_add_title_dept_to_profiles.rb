class AddTitleDeptToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :title, :string, before: :created_at
    add_column :profiles, :department, :string, before: :created_at
  end
end
