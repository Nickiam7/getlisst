class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  has_many :collaborated_lists, through: :collaborations, source: :lists
end
