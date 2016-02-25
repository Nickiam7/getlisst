class ItemPolicy < ApplicationPolicy
  def show?
    record.list.user == user || (record.list.items.include?(record) && record.list.collaborators.include?(user))
  end
end