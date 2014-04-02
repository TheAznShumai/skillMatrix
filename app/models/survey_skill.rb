class SurveySkill < ActiveRecord::Base
  belongs_to :survey
  belongs_to :skill
end
