require 'rails_helper'

RSpec.describe "Results", type: :request do
  describe "Questions" do
    setup do
      @user = create(:user, password: "123456")
      @quiz = create(:quiz)
      @question = create(:question)
      @token = JsonWebToken.encode({ uid: @user.id })
      @authorization_header = 
        {
          Authorization: "Bearer #{@token}"
        }
    end

    it "create result" do
      post results_url,
      headers: @authorization_header,
      params: {
        data: {
          type: "results",
          attributes: {
            content: "result10101",
            coefficient: 2,
            quiz_id: @quiz.id,
            user_id: @user.id,
            answered_question: [
              {choice_uuid: "Choice 1", question_id: @question.id}
            ]
          }
        }
      }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it "update result" do
      attributes = { score: 3 }
      patch result_url(@result),
            headers: @authorization_header,
            params: {
              data: {
                id: @result.id.to_s,
                type: "results",
                attributes: attributes
              }
            }, as: :json
      assert_response 200
      body_as_json = JSON.parse(response.body)
      assert_equal 3, body_as_json["entity"]["content"]
    end

    it "destroy result" do
      delete result_url(@result), headers: @authorization_header, as: :json
      assert_response 204
    end
  end

end
