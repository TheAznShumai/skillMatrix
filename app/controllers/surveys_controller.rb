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

    def index
      @surveys = Survey.where(true)
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
                       :name, :icon,
                       :rateable_skills_attributes => [:name, :_destroy],
                       :questions_attributes => [:text, :_destroy])
    end

end

