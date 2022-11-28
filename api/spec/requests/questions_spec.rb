require 'rails_helper'

RSpec.describe "Questions", type: :request do
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

    it "create question" do
      post questions_url,
      headers: @authorization_header,
      params: {
        data: {
          type: "questions",
          attributes: {
            content: "question10101",
            coefficient: 2,
            quiz_id: @quiz.id,
            answer_choices: [
              {choice: "Choice 1", is_correct: false},
              {choice: "Choice 2", is_correct: true},
              {choice: "Choice 3", is_correct: false}
            ]
          }
        }
      }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it "update question" do
      attributes = { content: "Myquestion" }
      patch question_url(@question),
            headers: @authorization_header,
            params: {
              data: {
                id: @question.id.to_s,
                type: "questions",
                attributes: attributes
              }
            }, as: :json
      assert_response 200
      body_as_json = JSON.parse(response.body)
      assert_equal "Myquestion", body_as_json["entity"]["content"]
    end

    it "destroy question" do
      delete question_url(@question), headers: @authorization_header, as: :json
      assert_response 204
    end
  end

end
