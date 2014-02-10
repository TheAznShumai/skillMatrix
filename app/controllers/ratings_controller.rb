class RatingsController < ApplicationController
    def create
        @rating = Rating.new(params[:rating])
        @skill = Skill.find(params[:rating][:skill_id])
            respond_to do |format|
                if @rating.save
                    format.json { render :json => { :avg_rating => @store.avg_rating } }
                else
                    format.json { render :json => @rating.errors, :status => :unprocessable_entity }
                end
            end
    end

    def update
        @rating = Rating.find(params[:id])
        @skill = Skill.find(params[:rating][:skill_id])
        @rating.update_attributes(new_rating_params)
                              
        #binding.pry
        
        respond_to do |format|
            if @rating.save
                format.json { render :json => { :avg_rating => @skill.rating.score } }
            else
                format.json { render :json => @rating.errors, :status => :unprocessable_entity }
            end
        end
    end

    private 

    def new_rating_params
        params.require(:rating).permit(:skill_id, :score)
    end

    def avg_rating
        average_rating = 0.0
        count = 0
        ratings.each do |rating| 
            average_rating += rating.stars
            count += 1
        end
        
        if count != 0
            (average_rating / count)
        else
            count
        end
    end
end
