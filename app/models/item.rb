class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  has_many :subtasks
  has_one :user
  accepts_nested_attributes_for :subtasks, reject_if: :all_blank, allow_destroy: true
end
