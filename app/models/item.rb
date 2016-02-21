class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  has_many :subtasks
  accepts_nested_attributes_for :subtasks, reject_if: :all_blank, allow_destroy: true
end
