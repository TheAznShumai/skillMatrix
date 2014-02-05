class RateableSkillsController < ApplicationController
    def new
        @rateable_skill = RateableSkill.new
    end
end
