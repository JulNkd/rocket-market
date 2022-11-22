class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    @reservation ? record.user == user || record.rocket_id.user_id == user : false
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
