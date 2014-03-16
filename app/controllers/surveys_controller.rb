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

    private

    def new_survey_params
        params.require(:survey).permit(
                       :name, :icon, 
                       :rateable_skills_attributes => [:name, :_destroy],
                       :questions_attributes => [:text, :_destroy]) 
    end

end

