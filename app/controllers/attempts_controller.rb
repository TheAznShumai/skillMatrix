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

  def index
    @attempts = Attempt.where(:survey_id => params[:survey_id]).joins(:user).includes(:user => :profile)
    @survey_name = Survey.where(:id => params[:survey_id]).first.name
  end

  def show
    @attempt = Attempt.where(:id => params[:id]).includes(:survey).first
    @questions = Question.from_survey_attempt(params[:survey_id], params[:id]).includes(:answers)
    @ratings = Rating.from_survey_attempt(params[:survey_id], params[:id])
    binding.pry
  end

  def edit
    @attempt = Attempt.where(:id => params[:id]).first
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
    @survey = Survey.where(:id => params[:survey_id]).first
    @questions = @survey.questions
    @skills = Skill.joins(:survey_skills => :survey).where(:surveys => {:id => params[:survey_id]})
  end

end

