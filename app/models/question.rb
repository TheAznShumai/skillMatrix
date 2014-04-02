class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey

  validates :text, presence: true

  scope :from_survey_attempt, ->(survey_id, attempt_id) { joins(:survey => :attempts).where(:survey_id => survey_id,
                                                                                     :attempts => {:id => attempt_id}) }
end
