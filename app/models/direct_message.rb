class DirectMessage < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages

  validates :sender, uniqueness: { scope: :receiver }

  def other_person(current_user)
    @other_person ||= if sender == current_user
                        receiver
                      else
                        sender
                      end
  end

  def latest_message
    @latest_message ||= messages.last
  end
end
