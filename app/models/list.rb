class List < ActiveRecord::Base
  belongs_to :user

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user, dependent: :destroy

  validates :title, presence: true
  validates :description, length: {maximum: 160}

  def list_completed?
    items.any? && (items.count == items.complete.count) ? "check-square-o" : "minus-square-o"
  end

  def list_completed_color
    list_completed? == "check-square-o" ? "uk-text-success" : "uk-text-danger"
  end

  def list_percentage_complete
   items.any? ? (items.complete.count / items.count.to_f * 100).round(0) : 0
  end
end
