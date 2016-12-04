class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def create
    Event.create(event_params)
    redirect_to '/events'
  end

  def event_params
    params.require(:event).permit(:name)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to '/events'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = 'Event Deleted Successfully'
    redirect_to '/events'
  end
end
