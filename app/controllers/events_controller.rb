class EventsController < ApplicationController
  before_action :find_event, only: :show

  def index
    @events =Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :photo, :address, :category, :date, :description, :capacity, :lat, :lng)
  end
end
