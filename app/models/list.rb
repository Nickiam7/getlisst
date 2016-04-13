class List < ActiveRecord::Base
  belongs_to :user

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user, dependent: :destroy

  validates :title, presence: true
  validates :description, length: {maximum: 160}

  def list_completed?
    if items.any? && (items.count == items.complete.count)
      "check-square-o"
    else
      "minus-square-o"
    end
  end

  def list_completed_color
    if list_completed? == "check-square-o"
      "uk-text-success"
    else
      "uk-text-danger"
    end
  end

  def list_percentage_complete
   items.any? ? (items.complete.count / items.count.to_f * 100).round(0) : 0
  end

end
