require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }
  describe "#quiz" do
    it "is not empty" do
      expect do
        question.quiz_id = nil
        question.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "has correct answer" do
      expect do
        question.quiz_id = nil
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
