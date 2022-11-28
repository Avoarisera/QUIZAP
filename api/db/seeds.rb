user = User.create!( first_name: "Teacher",last_name: "Example", email: "teacher@example.com", password: "12345678")
quiz = Quiz.create!(name: "first Quiz", description: "this quiz is to test the app", user: user)
question_1 = Question.create!(quiz: quiz, content: "first question" ,coefficient: 1 ,answer_choices: [{choice: "Choice 1", is_correct: false}, {choice: "Choice 2", is_correct: false}, {choice: "Choice 3", is_correct: true}])
question_2 = Question.create!(quiz: quiz,content: "Second question", coefficient: 1, answer_choices: [{choice: "Choice 2 1", is_correct: false}, {choice: "Choice2 2", is_correct: false}, {choice: "Choice2 3", is_correct: true}])
question_3 = Question.create!(quiz: quiz,content: "Third question", coefficient: 1, answer_choices: [{choice: "Choice3 1", is_correct: false}, {choice: "Choice3 2", is_correct: false}, {choice: "Choice3 3", is_correct: true}])