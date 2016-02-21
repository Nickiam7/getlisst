class ItemPolicy < ApplicationPolicy
  def show?
    user == record.list.user
  end
end