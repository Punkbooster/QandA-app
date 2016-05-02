class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :destroy, :update]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show

  end

  def create
    @event = Event.new(params.require(:event).permit(:title, :description))

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params

  end
end
