class DirectMessage < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages

  validates :sender, uniqueness: { scope: :receiver }

  scope :with_users_avatar, -> { includes(:sender, receiver: [avatar_attachment: :blob] )}

  def other_person(current_user)
    @other_person ||= if sender == current_user
                        receiver
                      else
                        sender
                      end
  end

  def any_message?
    # Excuse me WTF `bullet`?
    messages.includes(:messages).any?
  end

  def latest_message
    @latest_message ||= messages&.last
  end

  def latest_message_content
    @latest_message_content ||= latest_message&.content
  end

  def latest_message_created_at
    @latest_message_created_at ||= latest_message&.created_at
  end
end
