class Skill < ActiveRecord::Base
    has_one :rating, dependent: :destroy
    # before_create :build_default_rating

    belongs_to :user
    validates :name, presence: true

    def self.add_to_skills(user, skill_names)
        skills = []
        user_id = user.id
        skill_names.each do |f|
          name = (f.name).downcase
          
        end
        return skills
    end

    private

    def build_default_rating
        build_rating(score: 1)
        true
    end

end
