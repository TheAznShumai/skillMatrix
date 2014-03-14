class RemoveAssociationIdsFromSkillRating < ActiveRecord::Migration
  def change
    remove_column :skills, :user_id
    remove_column :ratings, :skill_id
  end
end
