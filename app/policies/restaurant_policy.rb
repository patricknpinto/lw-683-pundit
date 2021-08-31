class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # if we want the users to see only the restaurants they created
      # scope.where(user: user)
    end
  end

  # user: currently logged in user (same as current_user)
  # record: record that we are authorizing (instance of Restaurant in this case)

  def create?
    true
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.user || user.admin?
  end
end
