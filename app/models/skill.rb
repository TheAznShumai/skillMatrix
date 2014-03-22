class Skill < ActiveRecord::Base
    has_many :user_skills
    has_many :users, :through => :user_skills
    validates :name, presence: true

    acts_as_taggable

    private

    def self.add_to_skills(user, skill_names)
        skills = []
        skill_names.each do |skill_name|
          skills << user.skills.find_or_create_by(
                      :name => skill_name.downcase)
        end
        skills.collect{ |skill| skill.id }
    end
end
