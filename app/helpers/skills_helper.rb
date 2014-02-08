module SkillsHelper
    def find_skill_by_name(name)
        #@skill = current_user.skills.find_or_initialize_by_name(id: params[:id], name: name)
        @skill = current_user.skills.find(params[:id])
    end
end
