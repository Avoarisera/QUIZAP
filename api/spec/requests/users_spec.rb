require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "users" do
    setup do
      @user = create(:user, password: "123456")
      @token = JsonWebToken.encode({ uid: @user.id })
      @authorization_header = 
        {
          Authorization: "Bearer #{@token}"
        }
    end

    it "create user" do
      post users_url,
      headers: @authorization_header,
      params: {
        data: {
          type: "users",
          attributes: {
            first_name: "John",
            last_name: "Doe",
            email: "john@doe.com",
            password: "123456"
          }
        }
      }, as: :json
      expect(response).to have_http_status(:created)
    end

    it "update user" do
      attributes = { first_name: "Myuser" }
      patch user_url(@user),
            headers: @authorization_header,
            params: {
              data: {
                id: @user.id.to_s,
                type: "users",
                attributes: attributes
              }
            }, as: :json
      assert_response 200
      body_as_json = JSON.parse(response.body)
      assert_equal "Myuser", body_as_json["first_name"]
    end

    it "destroy user" do
      delete user_url(@user), headers: @authorization_header, as: :json
      assert_response 204
    end
  end

end
