class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Post
    if user.role == 'admin'
      can :manage, :all
    else
      can :create, Post do |post|
        post.author == user
      end

      can :destroy, Post do |post|
        post.author == user
      end
      can :create, Comment
      can :destroy, Comment do |comm|
        comm.author == user
      end
    end
  end
end
