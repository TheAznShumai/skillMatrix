class AddIdsToUserSkills < ActiveRecord::Migration
  def change
    add_column :user_skills, :user_id, :integer 
    add_column :user_skills, :skill_id, :integer
    add_index :user_skills, :user_id
    add_index :user_skills, :skill_id
    add_index :user_skills, [:user_id, :skill_id], :unique => true
  end
end
