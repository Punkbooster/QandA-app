class QuestionsController < ApplicationController
  before_action :find_event, only: [:create, :edit, :update, :destroy, :upvote]
  before_action :find_question, only: [:edit, :update, :destroy, :upvote]

  def create
    @question = @event.questions.create(question_params)
    @question.user_id = current_user.id if current_user
    @question.save
    respond_to do |format|
      format.html {
        if @question.save
    			redirect_to event_path(@event)
    		else
    			render 'new'
    		end
      }
      format.js { render layout: false } # render questions/create.js.erb
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:alert] = "Question successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    if @question.user != current_user
      flash[:notice] = "Can't delete this question."
    else
      @question.destroy
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js { render layout: false } # JavaScript response
      end
    end
  end

  def upvote
    session[:voting_id] = request.remote_ip
    voter = Session.find_or_create_by(ip: session[:voting_id])
    @question.upvote_by voter
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
