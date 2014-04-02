class Skill < ActiveRecord::Base
    has_many :user_skills
    has_many :surveys_skills
    has_many :surveys, :through => :survey_skills
    has_many :users, :through => :user_skills
    validates :name, presence: true

    acts_as_taggable

end
