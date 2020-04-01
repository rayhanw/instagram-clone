class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  has_many_attached :photos

  def liked_by_user?(user)
    likes.map(&:user).include? user
  end
end
