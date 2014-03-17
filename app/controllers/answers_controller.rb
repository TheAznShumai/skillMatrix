class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(new_answer_params)
    if @answer.save
      redirect_to_root
    end
  end

  private

  def new_answer_params
    params.require(:answer).permit(:text)
  end

end

