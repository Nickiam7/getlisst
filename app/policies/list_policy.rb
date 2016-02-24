class ListPolicy < ApplicationPolicy
  def show?
    user.present? && (record.user == user || record.collaborators.include?(user))
  end
end