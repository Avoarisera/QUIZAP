class Result < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  validate :cant_submit_result_while_not_completed
  validate :choice_and_question_exists
  private

  def cant_submit_result_while_not_completed
    errors.add(:question, 'All questions must be answered') if result.quiz.questions.count != answered_question.count
  end

  def choice_and_question_exists
    answered_question.each do |answer_question|
      unless answer_question.key?("choice_uuid") && answer_question.key?("question_id")
        errors.add(:answer_question, "must NOT contain an is_correct and question attribute ") 
      end
    end
  end
end
