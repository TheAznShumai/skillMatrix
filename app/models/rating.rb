class Rating < ActiveRecord::Base
    belongs_to :user_skill
    #TODO - split the logic below and wrap inside a transaction

    protected

    def self.update_user_skill_ratings!(user_id, skill_ratings_params)
      user = User.where(:id => user_id).first

      #Looping through each params | Param Structure { "index" => {"value"} }
      skill_ratings_params.each_value do |skill_rating|
        user_rating = user.ratings.joins(:user_skill => :skill).where(:skills => {:name => skill_rating[:skill]}).first

        # Destroy/do nothing if skill rating is 0
        if skill_rating[:score].to_i > 0
          # Update the rating if it exists
          if user_rating
            user_rating.score = skill_rating[:score]
            Rating.update(user_rating.id, :score => skill_rating[:score]) if user_rating.changed?
          else
            # Create a new skill => rating association
            skill_id = Skill.where(:name => skill_rating[:skill]).pluck(:id).first
            user_skill = user.user_skills.build(:skill_id => skill_id)
            user_skill.save!
            user_rating = user.ratings.build(:user_skill_id => user_skill.id, :score => skill_rating[:score].to_i)
            user_rating.save!
          end
        else
          # Delete the existing skill/rating association for the user where score is 0
          if user_rating
            Rating.where(:id => user_rating.id).first.destroy
            skill_id = Skill.where(:name => skill_rating[:skill]).pluck(:id).first
            UserSkill.where(:user_id => user_id, :skill_id => skill_id).first.destroy
          end
        end
      end
    end
end
