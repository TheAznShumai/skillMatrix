class SkillsController < ApplicationController
    def new
        @skill = current_user.skills.build
    end
    
    def create
        @skill = current_user.skills.build(skill_params)
        if @skill.save then
            redirect_to root_url
        else
            render 'new'
        end
    end

    def show
        @skill = current_user.skills.find(params[:id])
    end

    def index
        @skills = current_user.skills.where(true)
    end

    def edit
        @skill = current_user.skills.find(params[:id])
    end

    private

    def skill_params
        params.require(:skill).permit(:name)
    end

end
