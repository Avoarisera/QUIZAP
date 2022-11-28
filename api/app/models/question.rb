class Question < ApplicationRecord
  belongs_to :quiz
  validates :content, presence: true
  validate :cant_create_question_without_correct_answer
  validate :answer_choices_has_correct_answer_and_choice_value
  before_create :assign_uuid_to_answer_choice

  private

  def has_correct_answer?
    answer_choices.any? {|answer_choice| answer_choice.with_indifferent_access[:is_correct] == true || answer_choice.with_indifferent_access[:is_correct] == 'true'}
  end

  def cant_create_question_without_correct_answer
    unless has_correct_answer?
      errors.add(:question, 'Must have at least one correct answer')
    end
  end
  
  def answer_choices_has_correct_answer_and_choice_value
    answer_choices.each do |answer_choice|
      unless answer_choice.key?("choice") && answer_choice.key?("is_correct")
        errors.add(:answer_choice, "must NOT contain an is_correct and choice attribute ") 
      end
    end
  end

  def assign_uuid_to_answer_choice
    answer_choices.each do |answer_choice|
      answer_choice[:uuid] = SecureRandom.hex(2)
    end
  end
end
