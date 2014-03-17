module AttemptsHelper
  def new_or_edit_attempt_path(survey, attempt)
    attempt.exists? ? edit_survey_attempt_path(:survey_id => survey.id, :id => attempt.first.id) :
      new_survey_attempt_path(:survey_id => survey.id)
  end
end
