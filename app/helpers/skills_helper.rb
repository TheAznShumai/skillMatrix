module SkillsHelper
    def add_to_skills(skill_names)
        @skills = []
        skill_names.each do |f|
            @skills << current_user.skills.where(:name => f.name).first_or_create(
                :name => f.name)
        end
        return @skills
    end
end
