class RenameColumnRateableSkillsDescToName < ActiveRecord::Migration
  def change
      rename_column :rateable_skills, :desc, :name
  end
end
