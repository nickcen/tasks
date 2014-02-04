class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    can [:edit, :update, :destroy], Task do |task|
      task.user == user
    end

    can :apply, Task do |task|
      task.user != user && task.can_apply? && !task.applied?(user)
    end

    can :cancel, Task do |task|
      task.user == user && task.can_cancel?
    end

    can [:edit, :update, :destroy], Apply do |apply|
      apply.user == user
    end

    can :assign, Apply do |apply|
      apply.task.user == user && apply.can_assign?
    end

    can :confirm, Apply do |apply|
      apply.task.user == user && apply.can_confirm?
    end

    can :complete, Apply do |apply|
      apply.user == user && apply.can_complete?
    end

    can :cancel, Apply do |apply|
      apply.user == user && apply.can_cancel?
    end

    can :abandon, Apply do |apply|
      apply.user == user && apply.can_abandon?
    end
  end
end
