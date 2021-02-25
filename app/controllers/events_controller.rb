class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_event, only: :show

  def index
    @top_events = Event.all.first(3)

    if params[:query].present?
      @events = Event.search_by_name_and_address_and_category(params[:query])
    else
      @events = Event.all
    end

     # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      flash[:notice] = 'Sorry, something went wrong!'
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
