FactoryBot.define do
  factory :message do
    direct_message { create(:direct_message) }
    author { create(:user) }
    content { Faker::Lorem.sentence(word_count: rand(10..40)) }
  end
end
