class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/1
  def show
    jsonapi_render json: @user
  end

  # PATCH/PUT /users/1
  def update

    if custom_params[:status] == 'suspended'
      @user.roles = []
    end

    if @user.update(custom_params)
      jsonapi_render json: @user
    else
      jsonapi_render_errors json: @user, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(custom_params)
    @user.status = "active"
    authorize @user if @user.valid?

    if @user.save
      jsonapi_render json: @user, status: :created
    else
      jsonapi_render_errors json: @user, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = policy_scope(User).find(params[:id])
      authorize @user
    end
end