class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :team_manager
      can :manage, :team
    elsif user.has_role? :team_member
      can :create, :task
    else
      can :read, :all
    end
  end
end
