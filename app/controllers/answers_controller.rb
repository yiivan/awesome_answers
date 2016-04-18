class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question
  before_action :find_and_authorize_answer, only: :destroy

  def create
    answer_params    = params.require(:answer).permit(:body)
    @answer          = Answer.new answer_params
    @answer.question = @question
    @answer.user     = current_user
    if @answer.save
      redirect_to question_path(@question), notice: "Thanks for answering"
    else
      flash[:alert] = "not saved"
      # this will render the show.html.erb inside views/questions
      render "/questions/show"
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question), notice: "Answer deleted!"
  end

  private

  def find_question
    @question = Question.find params[:question_id]
  end

  def find_and_authorize_answer
    @answer = @question.answers.find params[:id]
    # head will stop the HTTP request and send a response code depending on the
    # symbole (first argument) that you pass in.
    # head :unauthorized unless can? :destroy, @answer
    redirect_to root_path unless can? :destroy, @answer
  end
end
