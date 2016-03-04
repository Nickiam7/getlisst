class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  has_many :collaborations, dependent: :destroy
  has_many :collaborated_lists, through: :collaborations, source: :lists

  def user_included_in_list?
    lists.collaborations.include?(user)
  end
end
