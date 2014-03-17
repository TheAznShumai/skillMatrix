class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(new_question_params)
    if @question.save
      redirect_to root_url
    end
  end

  def update
  end

  def delete
  end

  private

  def new_question_params
    params.require(:question).permit(:text)
  end
end

