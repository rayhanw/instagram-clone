class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, uniqueness: { scope: :post }

  scope :with_post_photos, -> { includes(post: [photos_attachments: :blob]) }
end
