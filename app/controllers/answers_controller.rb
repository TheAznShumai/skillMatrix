class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(new_answer_params)
    binding.pry
    if @answer.save
      redirect_to root_url
    end
  end

  private

  def new_answer_params
    params.require(:answer).permit(:question_id, :text)
  end

end

