require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe '#email' do
    it 'is changeable' do
      user.email = 'correct@email.com'
      assert user.save!
    end

    it 'is not empty' do
      expect  {
        user.email = nil
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      expect  {
        user.email = ""
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is unique' do
      expect { 
        create(:user, email: "unique email")
        create(:user, email: "unique email") 
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is valid email' do
      expect {
        user.email = 'just_text'
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is transformed to lowercase' do
      user.email = 'UPPER@CASE.EMAIL'
      expect(user.email).to eq('upper@case.email')
    end
  end

  describe '#password' do
    it 'is changeable' do
      user.password = 'correct@email.com'
      assert user.save!
    end

    it 'is not empty' do
      expect  {
        user.password = nil
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      expect  {
        user.password = ""
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not less than 6 characters' do
      expect  {
        user.password = "12345"
        user.save!
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
