class AttemptsController < ApplicationController
  def new
    @attempt = Attempt.new
  end
  
  def create
    @attempt = Attempt.new(new_attempt_params)
  end

  private

  def new_attempt_params
    params.require(:attempt).permit(:user_id, :survey_id)
  end

end

