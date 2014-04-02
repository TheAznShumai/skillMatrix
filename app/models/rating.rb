class Rating < ActiveRecord::Base
    belongs_to :user_skill

    scope :from_survey_attempt, ->(survey_id, attempt_id) { Rating.joins(:user_skill => :skill).joins(
            "JOIN rateable_skills ON lower(rateable_skills.name) = lower(skills.name)").joins(
            "JOIN surveys ON surveys.id = rateable_skills.survey_id").joins(
            "JOIN attempts ON attempts.survey_id = rateable_skills.survey_id").where(
            :surveys => {:id => survey_id}, :attempts => {:id => attempt_id} ) }
end
