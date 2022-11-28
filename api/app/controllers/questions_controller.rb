class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    render json: @questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    if @question
      render json: @question
    else
      render status: 404, json: { status: :could_not_find }
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    if @question.save
      render json: { status: :created, entity: @question }
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if @question.update(question_params)
      render json: { status: 200, entity: @question }
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    head :no_content, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      begin
        @question = Question.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return
      end
    end

    def question_params
      params.require(:data).require(:attributes).permit(:content, :coefficient, :quiz_id, :answer_choices => [:choice, :is_correct])
    end

end
