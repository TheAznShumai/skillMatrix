class Skill < ActiveRecord::Base
    has_one :rating, dependent: :destroy
    before_create :build_default_rating

    belongs_to :user
    validates :name, :user_id, presence: true

    private

    def build_default_rating
        build_rating
        true
    end

end
