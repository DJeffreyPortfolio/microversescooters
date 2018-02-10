class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :create, [Comment, Order]
    if user.admin?
    	can :manage, :all
    end
  end
end
