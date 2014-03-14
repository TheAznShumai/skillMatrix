class Skill < ActiveRecord::Base
    has_many :user_skills
    has_many :users, :through => :user_skills
    validates :name, presence: true

    def self.add_to_skills(user, rateable_skills)
        rateable_skills.each do |rateable_skill|
          name = (rateable_skill.name).downcase
          user.skills.find_or_create_by(:name => name) 
        end
    end
end
