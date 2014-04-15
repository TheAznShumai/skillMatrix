class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      cannot :manage, :all
      can :manage, Profile, :user_id => user.id
      can :manage, User, :id => user.id
      can :read, Survey
      can :read, Project
      can :manage, Attempt, :user_id => user.id
      can [:create, :update], Rating do |rating|
        rating.user_skills.where(:user_id => user.id)
      end
    end
  end
end
