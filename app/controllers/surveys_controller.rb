class SurveysController < ApplicationController
    
    def new
        @survey = Survey.new
        @survey.rateable_skills.build
    end

    def create
        @survey = Survey.new(new_survey_params)
        if @survey.save
          redirect_to root_url
        else
          flash.now[:error] = 'Errors on the submission'
          render 'new'
        end
    end

    def index
      @surveys = Survey.where(true).paginate(:page => params[:page], :per_page => 3)
    end

    def show
        @survey = Survey.find(params[:id])
        rateable_skills = @survey.rateable_skills.where(true)
        @skills = Skill.add_to_skills(current_user, rateable_skills)
    end

    private

    def new_survey_params
        params.require(:survey).permit(:id, :name, :icon, rateable_skills_attributes: [:id, :name, :_destroy]) 
    end

end
