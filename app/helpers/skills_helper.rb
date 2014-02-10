module SkillsHelper
    def add_to_skills(skill_names)
        skill_names.each do |f|
            @skills = current_user.skills.where(:name => f.name).first_or_create(
                :name => f.name)
        end
    end

    def get_rating_by_id(skill_id)
        @rating = Rating.where(:skill_id => skill_id).first
    end

end
