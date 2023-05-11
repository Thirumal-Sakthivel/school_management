# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud
    user.roles.each { |role| send(role.name) }
  end

  def admin
    can :manage, :all
  end

  def student
    can :read, Enrollment
    can :read, User
  end

  def school_admin
    can :read, School
    can :read, Course
    can :read, Batch
    can :read, Enrollment
    can :read, User
  end
end
