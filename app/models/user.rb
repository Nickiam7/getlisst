class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  has_many :collaborations, dependent: :destroy
  has_many :collaborated_lists, through: :collaborations, source: :list, dependent: :destroy

  mount_uploader :user_photo, UserPhotoUploader

  def user_items_complete
    (items.complete.count / items.count.to_f * 100).round(0) if items.any?
  end

  def user_lists_complete
    (lists.list_complete.count / lists.count.to_f * 100).round(0) if lists.any?
  end

end
