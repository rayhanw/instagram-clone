# frozen_string_literal: true

FactoryBot.define do
  factory(:post) do
    description { Faker::Lorem.sentence(word_count: 10) }
    user { create(:user) }
  end
end
