class SurveysController < ApplicationController
    def new
        @survey = Survey.new
        @survey.rateable_skills.build

        format_response
    end

    def create
        @survey = Survey.new(new_survey_params)
        if @survey.save
          format_response
        else
          flash[:error] = @survey.errors.full_messages.uniq.join("\n")
        end
    end

    def index
      @surveys = Survey.where(true).paginate(:page => params[:page], :per_page => 3)
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

