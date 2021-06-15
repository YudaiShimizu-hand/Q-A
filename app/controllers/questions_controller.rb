class QuestionsController < ApplicationController
  def index
    @q = current_user.questions.ransack(params[:q])
    @questions = @q.result(distinct: true)
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
    @question = current_user.questions.find(params[:id])
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

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end
