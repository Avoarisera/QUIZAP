require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }
  describe "#quizz" do
    it "is not empty" do
      expect do
        question.quizz_id = nil
        question.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  describe "#content" do
    it "is not empty" do
      expect do
        question.content = nil
        question.save!
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect do
        question.content = ""
        question.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
