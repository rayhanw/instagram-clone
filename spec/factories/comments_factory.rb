FactoryBot.define do
  factory :comment do
    post { create(:post) }
    user { create(:user) }
    content { Faker::Lorem.sentence(word_count: rand(10..20)) }
  end
end
