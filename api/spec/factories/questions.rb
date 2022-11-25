FactoryBot.define do
  factory :question do
    content { "MyString" }
    coefficient { "MyString" }
    quiz { association :quiz }
  end
end
