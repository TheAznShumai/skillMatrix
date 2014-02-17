class RateableSkill < ActiveRecord::Base
    belongs_to :survey
    validates :name, presence: true
end
