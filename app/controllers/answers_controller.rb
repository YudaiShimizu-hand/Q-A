class AnswersController < ApplicationController
    def create
        @answer = Answer.new(answer_params.merge(user_id: current_user.id, question_id: params[:question_id]))
        if @answer.save
         redirect_to question_path(params[:question_id])
        else
            redirect_to question_path(params[:question_id])
        end
    end

    def destroy
        @answer = current_user.answers.find(params[:id])
        @answer.destroy
        redirect_to question_path(params[:question_id])

    end

    private
    def answer_params
        params.require(:answer).permit(:body)
    end
end
