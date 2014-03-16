class AttemptsController < ApplicationController
  def new
    @attempt = Attempt.new
    @attempt.answers.build

    @survey = Survey.find(params[:survey_id])

    rateable_skills = @survey.rateable_skills.where(true).pluck(:name)
    skill_ids = Skill.add_to_skills(current_user, rateable_skills)

    @ratings = current_user.ratings.joins(:user_skill).find(
                                          :all, :conditions => 
                                        { :user_skills => 
                                        { :skill_id =>  skill_ids }}) 

    @questions = @survey.questions.where(true)
  end
  
  def create
    @attempt = Attempt.new(new_attempt_params)
  end

  private

  def new_attempt_params
    params.require(:attempt).permit(:user_id, :survey_id, 
                                    :answers_attributes => [:text])
  end

end

