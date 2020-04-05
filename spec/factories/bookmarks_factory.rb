FactoryBot.define do
  factory :bookmark do
    user { create(:user) }
    post { create(:post) }
  end
end
