class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user.admin ? true : owner_of?
  end

  def destroy?
    user.admin ? true : owner_of?
  end

  private

  def owner_of? #if the user is owner of that book
    record.user == user
  end
end
