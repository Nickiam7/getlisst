class ListPolicy < ApplicationPolicy
  def show?
    record.user == user || record.collaborators.include?(user)
  end

  def add_collaborators?
    record.user == user
  end
end