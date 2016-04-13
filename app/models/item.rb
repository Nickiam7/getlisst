class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  has_many :subtasks, dependent: :destroy
  has_one :user
  accepts_nested_attributes_for :subtasks, reject_if: :all_blank, allow_destroy: true

  scope :complete, -> {where(item_status: true)}
  scope :incomplete, -> {where(item_status: false)}

end
