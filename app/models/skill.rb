class Skill < ActiveRecord::Base
    has_one :rating, dependent: :destroy
    before_create :build_default_rating

    belongs_to :user
    validates :name, :user_id, presence: true

    def self.add_to_skills(user, skill_names)
        skills = []
        user_id = user.id
        skill_names.each do |f|
          name = (f.name).downcase
          skills << Skill.where(user_id: user_id, name: name).first_or_create(
                                :name => name)
        end
        return skills
    end

    private

    def build_default_rating
        build_rating(score: 1)
        true
    end

end
