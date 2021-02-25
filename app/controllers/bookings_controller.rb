class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(event: @event, user: current_user, confirmed: false)
    @booking.save
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
