class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  has_one :rating

  before_create :build_default_rating

  private

  def build_default_rating
    build_rating(score: 1)
    true
  end
end
