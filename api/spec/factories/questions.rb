FactoryBot.define do
  factory :question do
    content { "MyString" }
    coefficient { "MyString" }
    quiz { association :quiz }
    answer_choices { [{choice: "Choice 1", is_correct: true}] }
  end
end
