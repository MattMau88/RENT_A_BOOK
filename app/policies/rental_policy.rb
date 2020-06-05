class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    if owner_of?
      true
    else
      (record.status == "pending") && (record.user == user || record.book.user == user)
    end
  end

  def create?
    true
  end

  def new?
    create?
  end

  private
  def owner_of? #if the user is owner of that book
    record.owner == user
  end
end
