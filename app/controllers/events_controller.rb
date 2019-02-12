class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
  	
  end

  def create
	@event = Event.new(title: params["title"], description: params["description"], start_date: params["start_date"], duration: params["duration"], price: params["price"], location: params["location"], user_id: "1")
  	#@gossip.user = current_user
    if @event.save
    	redirect_to "/events"
  	else
  		redirect_to "/events/new"
  	end
  end

  def show
    @event = Event.find(params["id"])
  end

end