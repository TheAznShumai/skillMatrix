class SurveysController < ApplicationController
    def new
        @survey = Survey.new
        @survey.rateable_skills.build
    end

    def create
        @survey = Survey.new(new_survey_params)
        if @survey.save
                redirect_to root_url
        end
    end

    def index
        @surveys = Survey.all
    end

    private

    def new_survey_params
        params.require(:survey).permit(:id, :name, rateable_skills_attributes: [:id, :desc, :_destroy]) 
    end

end
