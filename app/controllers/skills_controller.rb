class SkillsController < ApplicationController
    def new
        @skill = Skill.new
    end
    
    def create
        @skill = skill(skill_params)
        if @skill.save then
            redirect_to root_url
        else
            render 'new'
        end
    end

    def show
        @skill = Skill.find(params[:id])
    end

    def index
        @skill = Skill.all
        respond_to do |format|
            format.html
            format.xml {render xml: @skill}
            format.json {render json: @skill}
        end
    end

    def edit
        @skill = Skill.find(params[:id])
    end

    private

    def skill_params
        params.require(:skill).permit(:name)
    end

end
