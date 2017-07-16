class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :author
      can :create, Status # author can create status
      can :update, Status # author can update status
      # can :destroy, Status # #uncomment this line, author can destroy status
      can :read, :all
    else
      can :read, :all
    end
  end
end
