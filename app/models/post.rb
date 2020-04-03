class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  has_many_attached :photos

  validates :photos, presence: true
  validate :at_least_one_photo

  scope :with_photo_blobs, -> { includes(photos_attachments: [:blob]) }

  def liked_by_user?(user)
    likes.map(&:user).include? user
  end

  def find_like(attributes = {})
    likes.find_by(attributes)
  end

  def any_likes?
    likes.any?
  end

  def any_comments?
    comments.any?
  end

  def first_comment
    @first_comment ||= comments.first
  end

  def last_comments
    @last_comments ||= comments.last(2)
  end

  def first_and_last_comments
    @first_and_last__comments ||= [*[first_comment] + last_comments].uniq.compact
  end

  def photos_attached?
    photos.attached?
  end

  def first_photo
    @first_photo ||= if photos_attached?
                      photos[0].key
                    else
                      "https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                    end
  end

  def first_comment?(comment)
    comments.first == comment
  end

  private

  def at_least_one_photo
    if photos.length.zero?
      errors.add(:photos, 'must have at least one photo')
    end
  end
end
