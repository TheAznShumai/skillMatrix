class Skill < ActiveRecord::Base
    before_create :build_default_rating

    has_many :user_skills
    has_many :users, :through => :user_skills
    validates :name, presence: true

    def self.add_to_skills(user, rateable_skills)
        skills = []
        rateable_skills.each do |rateable_skill|
          name = (rateable_skill.name).downcase
          skills << user.skills.find_or_create_by(:name => name) 
        end
        return skills
    end

    private

    def build_default_rating
        build_rating(score: 1)
        true
    end

end
