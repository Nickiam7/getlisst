class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists, dependent: :destroy
  has_many :collaborations
  has_many :collaborated_lists, through: :collaborations, source: :lists

  mount_uploader :user_photo, UserPhotoUploader

end
