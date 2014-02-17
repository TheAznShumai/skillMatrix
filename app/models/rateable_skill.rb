class RateableSkill < ActiveRecord::Base
    belongs_to :survey
    validates :name, :survey_id, presence: true
end
