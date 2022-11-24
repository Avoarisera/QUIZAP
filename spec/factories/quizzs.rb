FactoryBot.define do
  factory :quizz do
    name { "MyString" }
    description { "MyString" }
    user { association :user }
  end
end
