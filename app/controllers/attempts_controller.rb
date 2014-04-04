class AttemptsController < ApplicationController
  authorize_resource
  before_action :load_survey_data, :only => [:new, :edit]

  def new
    @attempt = Attempt.new
    @attempt.answers.build
  end

  def create
    @attempt = Attempt.new(new_attempt_params)
    Rating.update_user_skill_ratings!(current_user.id, all_params[:user_skill_ratings])
    if @attempt.save
      redirect_to root_url
    else
      flash[:error] = @attempt.errors.full_messages
    end
  end

  def index
    @attempts = Attempt.where(:survey_id => params[:survey_id]).joins(:user).includes(:user => :profile)
    @survey_name = Survey.where(:id => params[:survey_id]).pluck(:name).first
  end

  def show
    @attempt = Attempt.where(:id => params[:id]).includes(:survey).first
    load_survey_data(@attempt.user_id, @attempt.survey_id)
  end

  def edit
    @attempt = Attempt.where(:id => params[:id]).first
  end

  def update
    @attempt = Attempt.where(params[:id]).first
    if @attempt.update_attributes(new_attempt_params)
      Rating.update_user_skill_ratings!(current_user.id, all_params[:attempt][:user_skill_ratings])
      redirect_to surveys_path
    else
      flash[:error] = @attempt.errors.full_messages
    end
  end

  private

  def new_attempt_params
    all_params.except(:user_skill_ratings)
  end

  def all_params
    params.require(:attempt).permit(:user_id, :survey_id,
                   :user_skill_ratings => [:skill, :score],
                   :answers_attributes => [:id, :question_id, :text])
  end

  def load_survey_data(user_id = current_user.id, survey_id = params[:survey_id])
    @survey = Survey.where(:id => survey_id).first
    @survey_questions = @survey.questions
    @survey_skills = Skill.from_survey(survey_id).pluck(:name)
    @user_skill_ratings = UserSkill.rated(user_id).pluck("skills.name", "ratings.score").reduce(Hash.new(0)) { |hash, x| hash.merge(x[0] => x[1]) }
  end

end

