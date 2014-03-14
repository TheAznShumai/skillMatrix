class DropUsersSkills < ActiveRecord::Migration
  def change
    drop_table :users_skills
  end
end
