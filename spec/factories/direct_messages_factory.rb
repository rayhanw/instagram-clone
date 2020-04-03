FactoryBot.define do
  factory :direct_message do
    sender { create(:user) }
    receiver { create(:user) }
  end
end
