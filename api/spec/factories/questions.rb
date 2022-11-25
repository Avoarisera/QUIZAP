FactoryBot.define do
  factory :question do
    content { "MyString" }
    coefficient { "MyString" }
    quizz { association :quizz }
  end
end
