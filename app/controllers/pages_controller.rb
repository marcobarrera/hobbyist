class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events = Event.where("date >= ?", Date.today).order(date: :asc).limit(4)
  end
end
