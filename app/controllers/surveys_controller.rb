class SurveysController < ApplicationController
  load_and_authorize_resource :param_method => :new_survey_params
  #TODO - Use Respond_to/respond_with instead

  def new
    format_response
  end

  def create
    flash.clear
    if @survey.save
      flash[:success] = "Survey \"#{@survey.name}\" has been saved"
      format_response
    else
      flash[:error] = @survey.errors.full_messages.uniq.join("\n")
    end
  end

  def edit
    format_response
  end

  def update
    if @survey.update_attributes(new_survey_params)
      format_response
    else
      flash[:error] = @survey.errors.full_messages.uniq.join("\n")
    end
  end

  def destroy
    surveyTitle = @survey.name
    surveyId = @survey.id
    @survey.destroy
    flash[:success] = "#{surveyTitle} was deleted"
    respond_to do |format|
      format.html
      format.js {render "destroy", :locals => {:deletedId => surveyId}}
    end
  end

  def index
    @survey_tags = ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.taggable_type = ?", "Survey").pluck("DISTINCT name")
  end

  def admin
    @surveys = Survey.where(true)
    @survey_tags = ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.taggable_type = ?", "Survey").pluck("DISTINCT name")
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

  def format_response
    respond_to do |format|
      format.html
      format.js
    end
  end
end

