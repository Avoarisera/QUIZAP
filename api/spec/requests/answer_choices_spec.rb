require 'rails_helper'

RSpec.describe "AnswerChoices", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/answer_choices/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/answer_choices/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/answer_choices/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
