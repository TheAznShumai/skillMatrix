class SurveysController < ApplicationController
    include SkillsHelper
    
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

    def show
        @survey = Survey.find(params[:id])
        rateable_skills = @survey.rateable_skills.where(true)
        @skills = add_to_skills(rateable_skills)
    end

    private

    def new_survey_params
        params.require(:survey).permit(:id, :name, rateable_skills_attributes: [:id, :name, :_destroy]) 
    end

end
