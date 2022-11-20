require 'rails_helper'

RSpec.describe "Results", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/results/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/results/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/results/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/results/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
