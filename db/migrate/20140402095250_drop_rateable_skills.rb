class DropRateableSkills < ActiveRecord::Migration
  def change
    drop_table :rateable_skills
  end
end
