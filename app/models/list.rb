class List < ActiveRecord::Base
  belongs_to :user

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user, dependent: :destroy

  validates :title, presence: true
  validates :description, length: {maximum: 160}

  scope :list_complete, -> {where(list_status: true)}
  scope :list_incomplete, -> {where(list_status: false)}


  def update_list_status
    if items.any? && (items.count == items.complete.count)
        update_attribute(:list_status, true)
        "check-square-o"
    else
        update_attribute(:list_status, false)
        "minus-square-o"
    end
  end

  def list_completed_color
    update_list_status == "check-square-o" ? "uk-text-success" : "uk-text-danger"
  end

  def list_percentage_complete
   items.any? ? (items.complete.count / items.count.to_f * 100).round(0) : 0
  end
end
