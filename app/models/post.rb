class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  has_many_attached :photos

  validates :photos, presence: true
  validate :at_least_one_photo

  scope :with_photo_blobs, -> { includes(photos_attachments: [:blob]) }

  def find_like(attributes = {})
    likes.find_by(attributes)
  end

  def first_comment
    @first_comment ||= comments.first
  end

  def last_comments
    @last_comments ||= comments.last(2)
  end

  private

  def at_least_one_photo
    if photos.length.zero?
      errors.add(:photos, 'must have at least one photo')
    end
  end
end
