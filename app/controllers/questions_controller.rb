class QuestionsController < ApplicationController
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page]).per(4)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params.merge(user_id: current_user.id))
    if @question.save
     redirect_to @question, notice: "質問「#{@question.title}」を追加しました。"
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = current_user.questions.find(params[:id])
    if @question.update(question_params)
     redirect_to @question, notice: "質問「#{@question.title}」を更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: "質問「#{@question.title}」を削除しました。"
  end

  def unsolved
  end

  def solved
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end
