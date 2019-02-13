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
    if @event.update(title: parasol["title"], description: parasol["description"], start_date: params["start_date"].to_datetime, duration: parasol["duration"], price: parasol["price"], location: parasol["location"])
      redirect_to "/events/#{params["id"]}"
    else
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
    @b = false
    @event = Event.find(params["id"])
    Attendance.all.each do |a|
      if a.user_id == current_user.id
        @b = true
      end
    end    
  end

end