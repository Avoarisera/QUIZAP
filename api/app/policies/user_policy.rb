class UserPolicy < ApplicationPolicy

  def delete_notification?
    @record.id == @user.id
  end

  def show?
    @user.has_role?(:teacher) || @record.id == @user.id
  end

  def update?
    create?
  end

  def create?
    @user.has_role?(:teacher)
  end

  class Scope < Scope
    def resolve
      scope.where(id: @user.id)
    end
  end
end