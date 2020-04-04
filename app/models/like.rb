class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, uniqueness: { scope: :post }

  scope :with_user, -> { includes(user: [:avatar_attachment]) }
end
