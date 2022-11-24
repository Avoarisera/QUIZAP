class Question < ApplicationRecord
  belongs_to :quizz
  validates :content, presence: true
end
