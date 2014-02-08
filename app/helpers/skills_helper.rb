module SkillsHelper
    def add_to_skills(skill_names)
        skill_names.each do |f|
        @skills = current_user.skills.where(:name => f.name).first_or_create(
            :name => f.name)
        end
    end
end
