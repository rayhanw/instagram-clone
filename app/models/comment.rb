class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  def long?
    content.length >= 35
  end
end
