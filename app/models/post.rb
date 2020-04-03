class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many_attached :photos

  validates :photos, presence: true
  validate :at_least_one_photo

  scope :with_photo_blobs, -> { includes(photos_attachments: [:blob]) }

  def first_photo
    @first_photo ||= photos[0].key
  end

  def find_like(attributes = {})
    likes.find_by(attributes)
  end

  def liked_by_user?(user)
    likes.map(&:user).include? user
  end

  def any_likes?
    @any_likes ||= likes.any?
  end

  def any_comments?
    @any_comments ||= comments.any?
  end

  def first_comment
    @first_comment ||= comments.first
  end

  def last_comments
    @last_comments ||= comments.last(2)
  end

  def first_and_last_comments
    @first_and_last_comments ||= [*[first_comment] + last_comments].uniq.compact
  end

  def first_comment?(comment)
    first_comment == comment
  end

  private

  def at_least_one_photo
    if photos.length.zero?
      errors.add(:photos, 'must have at least one photo')
    end
  end
end
