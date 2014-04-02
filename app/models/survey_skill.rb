class SurveySkill < ActiveRecord::Base
  belongs_to :survey
  belongs_to :skill
  accepts_nested_attributes_for :skill

  # validate_associated_record_for_skill
  def autosave_associated_records_for_skill
    if new_skill = Skill.where(:name => skill.name).first
      self.skill = new_skill
    else
      self.skill_id = self.skill.id if self.skill.save
    end
  end
end
