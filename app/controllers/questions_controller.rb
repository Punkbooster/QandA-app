class QuestionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @question = @event.questions.create(params[:question].permit(:content))
    if @question.save
			redirect_to event_path(@event)
		else
			render 'events/show'
		end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @question = @event.questions.find(params[:id])
    @question.destroy
		redirect_to event_path(@event)
	end
end
