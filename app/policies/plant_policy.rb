class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def new?
    true
  end

  def show?
    true
  end

  def my_plants?
    true
  end
end
