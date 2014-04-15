class RatingsController < ApplicationController
  load_and_authorize_resource
    def index
      @users = User.where(true).includes(:profile).includes(:ratings => :user_skill, :user_skills => :skill)
    end
end
