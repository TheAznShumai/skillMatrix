class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  has_one :rating

  scope :rated, ->(user_id) { joins(:user, :skill, :rating).where(:users => {:id => user_id}) }
end
