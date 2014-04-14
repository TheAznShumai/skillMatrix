class Skill < ActiveRecord::Base
    has_many :user_skills
    has_many :survey_skills
    has_many :surveys, :through => :survey_skills
    has_many :users, :through => :user_skills
    validates :name, presence: true
    validates :name, uniqueness: true

    acts_as_taggable

    scope :from_survey, ->(survey_id) { joins(:survey_skills => :survey).where(:surveys => {:id => survey_id}) }

end
