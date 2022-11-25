FactoryBot.define do
  factory :quiz do
    name { "MyString" }
    description { "MyString" }
    user { association :user }
  end
end
