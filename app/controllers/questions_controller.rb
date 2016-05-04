class QuestionsController < ApplicationController
  before_action :find_event, only: [:create, :edit, :update, :destroy]
  before_action :find_question, only: [:edit, :update, :destroy]

  def create
    @question = @event.questions.create(question_params)
    if @question.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to event_path(@event)
	end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_question
    @question = @event.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
