class Admin::EventsController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :find_event, only: [:show, :edit, :destroy, :update]

  def index
    @events = Event.all
  end

  def new
    @event = current_admin.events.build
  end

  def show
  end

  def create
    @event = current_admin.events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @event.destroy
    redirect_to admin_root_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
