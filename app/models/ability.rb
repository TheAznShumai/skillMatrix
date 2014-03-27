class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user_signed_in?
      cannot :manage, :all
      can :manage, :profile => {:user_id => user.id}
      can :manage, :skill => {:user_id => user.id}
      can :manage, :attempt => {:user_id => user.id}
      can :read, :static_pages
    else
      cannot :manage, :all
      can :read, :static_pages
    end
  end
end
