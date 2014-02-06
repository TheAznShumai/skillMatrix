class RateableSkillsController < ApplicationController
    def new
        @rateable_skill = RateableSkill.new
    end

    def create
        @rateable_skill = RateableSkill.new(params[:desc])
        if @rateable_skill.save
            redirect_to root_url
        end
    end
end
