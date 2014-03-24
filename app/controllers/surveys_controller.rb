class SurveysController < ApplicationController
    def new
     @survey = Survey.new
     @survey.rateable_skills.build

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
    end

    def update
      @survey = Survey.find(params[:id])
      if @survey.update_attribute(new_survey_params)
        format_response
      else
        flash[:error] = @survey.errors.full_messages.uniq.join("\n")
      end
    end

    def index
      @surveys = Survey.where(true).includes(:tags)
      @survey_tags = ActsAsTaggableOn::Tag.joins(:taggings).where("taggings.taggable_type = ?", "Survey").pluck(:name)
      format_response
    end

    private

    def format_response
      respond_to do |format|
        format.html
        format.js
      end
    end

    def new_survey_params
      params.require(:survey).permit(
                       :name, :tag_list, :icon,
                       :rateable_skills_attributes => [:name, :tag_list, :_destroy],
                       :questions_attributes => [:text, :_destroy])
    end

end

