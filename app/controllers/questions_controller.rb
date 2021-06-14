class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.save!
    redirect_to questions_url, notice: "質問「#{question.title}」を追加しました。"
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end
