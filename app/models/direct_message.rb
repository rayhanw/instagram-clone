class DirectMessage < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy

  validates :sender, uniqueness: { scope: :receiver }

  %i[sender receiver].each do |author|
    scope :"with_#{author}_avatar", -> { includes("#{author}": [avatar_attachment: :blob]) }
  end
  scope :by_latest_message, -> { includes(:messages).order('messages.created_at DESC') }

  def other_person(current_user)
    @other_person ||= if sender == current_user
                        receiver
                      else
                        sender
                      end
  end

  ## WARNING:
  # This is not reusable,
  # because of the `scope` above to be reverse-ordered (i.e. first <=> last).
  # Do not use this elsewhere until a better solution is found.
  ## SMALL NOTE:
  # Changed method name from `latest_message` -> `latest_message_reversed`
  # To be clearer than
  ##
  def latest_message_reversed
    @latest_message ||= messages&.first
  end

  def latest_message_reversed_content
    @latest_message_content ||= latest_message_reversed&.content
  end

  def latest_message_reversed_created_at
    @latest_message_created_at ||= latest_message_reversed&.created_at
  end
end
