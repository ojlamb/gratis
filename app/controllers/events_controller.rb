class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  end

  def create
    Event.create(restaurant_params)
    redirect_to '/events'
  end

  def restaurant_params
    params.require(:event).permit(:name)
  end

  def show
    @event = Event.find(params[:id])
  end
end
