# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :read, :update, to: :cru
    alias_action :read, :update, to: :read_update
    user.roles.each { |role| send(role.name) }
  end

  def admin
    can :manage, :all
  end

  def student
    can :cru, Enrollment
    can :read, User
    can :read, :school_users
  end

  def school_admin
    can :read_update, School
    can :crud, Course
    can :cru, Batch
    can :cru, Enrollment
    can :read, User
    can :read, :school_users
  end
end
