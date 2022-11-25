require "spec_helper"
require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  describe "Quizzes" do
    setup do
      @user = create(:user, password: "123456")
      @quiz = create(:quiz)
      @token = JsonWebToken.encode({ uid: @user.id })
      @authorization_header = 
        {
          Authorization: "Bearer #{@token}"
        }
    end
    it "create quiz" do
      post quizzes_url,
      headers: @authorization_header,
      params: {
        data: {
          type: "users",
          attributes: {
            name: "Test0101",
            description: "to test the test",
            user_id: @user.id
          }
        }
      }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it "update quiz" do
      attributes = { description: "desc" }
      patch quiz_url(@quiz),
            headers: @authorization_header,
            params: {
              data: {
                id: @quiz.id.to_s,
                type: "quizzes",
                attributes: attributes
              }
            }, as: :json
      assert_response 200
      body_as_json = JSON.parse(response.body)
      assert_equal "desc", body_as_json["entity"]["description"]
    end

    it "destroy quiz" do
      delete quiz_url(@quiz), headers: @authorization_header, as: :json
      assert_response 204
    end
  end

end
