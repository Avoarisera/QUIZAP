class AuthController < ApplicationController
  before_action :set_user
  # POST /sign_in
  def sign_in
    pp "***************"
    pp params
    pp set_user
    if set_user.authenticate(params[:password]) == false
      raise "invalid credentials"
    else
    # sets up token
    pp "token"
    pp token
    token = generate_token({ uid: @user.id })

    render json: { auth: token }, status: :created
    end
  end

  private
  def set_user
    begin
      @user = User.find_by_email(params[:email])
    rescue ActiveRecord::RecordNotFound
      return
    end
  end
end
