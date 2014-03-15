class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:text])
    if @question.save
      redirect_to root_url
    end
  end

  def update
  end

  def delete
  end
end

