class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.account_type == 'Artist'         
      can :manage, Track do |t|
        t && t.artist.user.id == user.id
      end
    else
      can :read, :all
    end
  end
end
