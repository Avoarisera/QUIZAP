require 'rails_helper'

RSpec.describe Quizz, type: :model do
  let(:user) { create(:user) }
  let(:quizz) { create(:quizz) }
  describe "#user" do
    it "is not empty" do
      expect do
        quizz.user_id = nil
        quizz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  describe "#name" do
    it "is not empty" do
      expect do
        quizz.name = nil
        quizz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect do
        quizz.name = ""
        quizz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "#description" do
    it "is not empty" do
      expect do
        quizz.description = nil
        quizz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect do
        quizz.description = ""
        quizz.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
