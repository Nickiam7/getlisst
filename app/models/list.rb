class List < ActiveRecord::Base
  belongs_to :user

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user, dependent: :destroy

  validates :title, presence: true
  validates :description, length: {maximum: 160}
end
