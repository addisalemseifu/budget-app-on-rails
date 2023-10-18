class Ability
  include CanCan::Ability

  def initialize(user) # rubocop:disable Metrics/MethodLength
    user ||= User.new
    if can :update, Group do |group|
         group.user == user
       end
      can :destroy, Group do |group|
        group.user == user
      end
      can :read, Group do |group|
        group.user == user
      end
      can :update, Entity do |entity|
        entity.user == user
      end
      can :destroy, Entity do |entity|
        entity.user == user
      end
      can :read, Entity do |entity|
        entity.user == user
      end
      can :update, GroupEntity do |group_entity|
        group_entity.user == user
      end
      can :destroy, GroupEntity do |group_entity|
        group_entity.user == user
      end
      can :read, GroupEntity do |group_entity|
        group_entity.user == user
      end
    end
  end
end
