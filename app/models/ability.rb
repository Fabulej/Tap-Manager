class Ability
  include CanCan::Ability

  def initialize(user)
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :create, Pub
        can :manage, Style
        can :manage, Brewery
        can [:create, :index], User
        can :manage, Priority
        can [:index, :read, :create, :destroy], Keg, pub_id: user.pub_id
        can :manage, Beer
        can :manage, Tap, pub_id: user.pub_id
      elsif user.manager?
        can :manage, Priority
        can :manage, Style
        can :manage, Brewery
        can [:index, :show, :create, :destroy], Keg, pub_id: user.pub_id
        can :manage, Beer
        can [:index, :read, :update], Tap, pub_id: user.pub_id
      elsif user.employee?
        can [:index, :destroy], Keg, pub_id: user.pub_id
        can :index, Beer
        can [:index, :update], Tap, pub_id: user.pub_id
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
