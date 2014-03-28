class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      cannot :manage, :all
      can :read, :static_pages
      can :manage, Profile, :user_id => user.id
      can :read, Survey
      can :manage, Attempt, :user_id => user.id
      can [:create, :update], Rating do |rating|
        rating.user_skills.where(:user_id => user.id)
      end
    end
  end
end
