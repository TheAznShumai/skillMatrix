class CreateSurveySkills < ActiveRecord::Migration
  def change
    create_table :survey_skills do |t|
      t.integer :survey_id
      t.integer :skill_id
      t.timestamps
    end
  end
end
