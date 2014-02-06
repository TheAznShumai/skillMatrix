class SurveysController < ApplicationController
    def new
        @survey = Survey.new
        @survey.rateable_skills.build
    end

    def create
        @survey = Survey.new(new_survey_params)
        @survey.rateable_skills.build(params[:survey][:rateable_skill])
        if @survey.save
                redirect_to root_url
        end
    end

    private

    def new_survey_params
        params.require(:survey).permit(:id, :name, rateable_skill_attributes: [:id, :desc]) 
    end

end
