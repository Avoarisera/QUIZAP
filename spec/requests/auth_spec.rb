require "spec_helper"
require "rails_helper"
require "./lib/json_web_token"
RSpec.describe "Auths", type: :request do
  describe "an user" do
    setup do
      @user = create(:user, password: "123456")
    end
    it "sign_in with email and password" do
      post sign_in_url,
           params: { email: @user.email, password: "123456" }
      byebug
      body_as_json = JSON.parse(response.body)
      assert_equal "201", response.code
      expect(response).to have_http_status(:created)
      expect(body_as_json).to include("auth")
      payload = JsonWebToken.decode(body_as_json["auth"])
    end
  end
end
