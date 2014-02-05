class CreateRateableSkills < ActiveRecord::Migration
  def change
    create_table :rateable_skills do |t|
      t.string :desc
      t.integer :survey_id

      t.timestamps
    end
  end
end
