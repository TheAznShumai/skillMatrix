module AttemptsHelper
  def new_or_edit_attempt_path(attempt)
    attempt ? edit_survey_attempt_path(attempt) : new_survey_attempt_path(attempt)
  end
end
