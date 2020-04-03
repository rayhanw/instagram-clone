class Message < ApplicationRecord
  belongs_to :direct_message
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates :content, presence: true, allow_blank: false
end
