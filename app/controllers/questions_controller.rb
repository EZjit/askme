class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update destroy show edit]

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Что-то пошло не так'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Вопрос сохранен!'
    else
      flash.now[:alert] = 'Что-то пошло не так'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, status: 303, notice: 'Вопрос удален!'
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
