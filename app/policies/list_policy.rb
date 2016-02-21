class ListPolicy < ApplicationPolicy
  def show?
    user == record.user
  end
end