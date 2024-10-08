# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == "admin"
      can :manage, :all
    else
      can :read, :all
      can :manage, Reservation, user_id: user.id
    end
  end
end
