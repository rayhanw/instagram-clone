FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.safe_email }
    password { 'password' }
    username { Faker::Internet.username(specifier: 6) }
    name { Faker::Name.name }
    bio { Faker::Lorem.sentence }
    website { Faker::Internet.url }
  end
end
