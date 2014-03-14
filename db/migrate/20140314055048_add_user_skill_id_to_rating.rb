class AddUserSkillIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :user_skill_id, :integer
  end
end
