class Question < ApplicationRecord
  belongs_to :quiz
  validates :content, presence: true
end
