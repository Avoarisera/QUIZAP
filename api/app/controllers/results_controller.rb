class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = result.all
    render json: @results
  end

  # GET /results/1
  # GET /results/1.json
  def show
    if @result
      render json: @result
    else
      render status: 404, json: { status: :could_not_find }
    end
  end

  # POST /results
  # POST /results.json
  def create
    @result = result.new(result_params)

    if @result.save
      render json: { status: :created, entity: @result }
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    if @result.update(result_params)
      render json: { status: 200, entity: @result }
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    head :no_content, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      begin
        @result = result.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return
      end
    end

    def result_params
      params.require(:data).require(:attributes).permit(:answered_question, :score)
    end

end
