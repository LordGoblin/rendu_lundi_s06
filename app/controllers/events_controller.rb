class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
  end

  def edit
    @event = Event.find(params[:id])
  end

    def update
    @event = Event.find(params[:id])
    parasol = params["event"]
    puts "**************************"
    puts params
    puts parasol
    if @event.update(title: parasol["title"], description: parasol["description"], start_date: params["start_date"].to_datetime, duration: parasol["duration"], price: parasol["price"], location: parasol["location"])
      puts "1111111111111111111111111111111111111111"
      redirect_to "/events/#{params["id"]}"
    else
      puts "2222222222222222222222222222222222222222222"
      render :edit
    end
  end

  def create
	@event = Event.new(title: params["title"], description: params["description"], start_date: params["start_date"], duration: params["duration"], price: params["price"], location: params["location"])
  	@event.user = current_user
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