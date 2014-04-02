class SurveysController < ApplicationController
  authorize_resource
  before_action :load_index_data, :only => [:index, :admin]
  #TODO - Use Respond_to/respond_with instead

  def new
    @survey = Survey.new
    format_response
  end

  def create
    @survey = Survey.new(new_survey_params)
    flash.clear
    if @survey.save
      flash[:success] = "Survey \"#{@survey.name}\" has been saved"
      format_response
    else
      flash[:error] = @survey.errors.full_messages.uniq.join("\n")
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    format_response
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(new_survey_params)
      format_response
    else
      flash[:error] = @survey.errors.full_messages.uniq.join("\n")
    end
  end

  def destroy
    survey = Survey.find(params[:id])
    surveyTitle = survey.name
    surveyId = survey.id
    survey.destroy
    flash[:success] = "#{surveyTitle} was deleted"
    respond_to do |format|
      format.html
      format.js {render "destroy", :locals => {:deletedId => surveyId}}
    end
  end

  def index
  end

  def admin
  end

  def submissions
    @surveys = Survey.joins(:attempts).distinct
    @survey_tags = ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.taggable_type = ?", "Survey").pluck("DISTINCT name")
  end

  private

  def new_survey_params
    params.require(:survey).permit(
      :name, :tag_list, :icon,
      :survey_skills_attributes => [:id, :_destroy, :skill_attributes => [:id, :name, :tag_list, :_destroy]],
      :questions_attributes => [:id, :text, :_destroy])
  end

  def load_index_data
    #TODO - optimize me please
    @surveys = Survey.where(true)
    @survey_tags = ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.taggable_type = ?", "Survey").pluck("DISTINCT name")
  end

  def format_response
    respond_to do |format|
      format.html
      format.js
    end
  end
end

