class SurveySkill < ActiveRecord::Base
  belongs_to :survey
  belongs_to :skill
  accepts_nested_attributes_for :skill
end
