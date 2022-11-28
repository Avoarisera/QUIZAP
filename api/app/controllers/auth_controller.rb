class AuthController < ApplicationController
  # POST /sign_in
  def sign_in
    pp "***************"
    pp params
    @user = User.find_by_email(params[:email])
    pp @user
    if @user.authenticate(params[:password]) == false
      raise "invalid credentials"
    else
    # sets up token
    token = generate_token({ uid: @user.id })

    render json: { auth: token }, status: :created
    end
  end
end
