class AttemptsController < ApplicationController
  authorize_resource
  before_action :load_survey_data, :only => [:new, :edit]

  def new
    @attempt = Attempt.new
    @attempt.answers.build
  end

  def create
    @attempt = Attempt.new(new_attempt_params)
    if @attempt.save
      redirect_to root_url
    else
      flash[:error] = @attempt.errors.full_messages
    end
  end

  def edit
    @attempt = Attempt.find(params[:id])
  end

  def update
    @attempt = Attempt.find(params[:id])
    if @attempt.update_attributes(new_attempt_params)
      redirect_to surveys_path
    else
      flash[:error] = @attempt.errors.full_messages
    end
  end

  private

  def new_attempt_params
    params.require(:attempt).permit(:user_id, :survey_id,
                   :answers_attributes => [:id, :question_id, :text])
  end

  def load_survey_data
    # TODO - MOVE TO MODEL
    @survey = Survey.find(params[:survey_id])

    rateable_skills = @survey.rateable_skills.where(true).pluck(:name)
    skill_ids = Skill.add_to_skills(current_user, rateable_skills)

    @ratings = current_user.ratings.joins(:user_skill).find(
                                          :all, :conditions =>
                                        { :user_skills =>
                                        { :skill_id =>  skill_ids }})

    @questions = @survey.questions.where(true)
  end

end

