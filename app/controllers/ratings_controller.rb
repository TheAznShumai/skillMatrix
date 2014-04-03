class RatingsController < ApplicationController
  authorize_resource
    def create
        @rating = Rating.new(params[:rating])
            respond_to do |format|
                if @rating.save
                    format.json
                else
                    format.json { render :json => @rating.errors, :status => :unprocessable_entity }
                end
            end
    end

    def update
        @rating = Rating.find(params[:id])
        @rating.update_attributes(new_rating_params)

        respond_to do |format|
            if @rating.save
                format.json
            else
                format.json { render :json => @rating.errors, :status => :unprocessable_entity }
            end
        end
    end

    def index
      @users = User.where(true).includes(:profile).includes(:ratings => :user_skill, :user_skills => :skill)
    end

    private

    def new_rating_params
        params.require(:rating).permit(:user_skill_id, :score)
    end
end
