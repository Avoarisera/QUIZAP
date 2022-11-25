require 'rails_helper'

RSpec.describe quiz, type: :model do
  let(:user) { create(:user) }
  let(:quiz) { create(:quiz) }
  describe "#user" do
    it "is not empty" do
      expect do
        quiz.user_id = nil
        quiz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  describe "#name" do
    it "is not empty" do
      expect do
        quiz.name = nil
        quiz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect do
        quiz.name = ""
        quiz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "#description" do
    it "is not empty" do
      expect do
        quiz.description = nil
        quiz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect do
        quiz.description = ""
        quiz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
