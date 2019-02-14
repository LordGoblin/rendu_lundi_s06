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
    if current_user
    Attendance.all.each do |a|
      if a.user_id == current_user.id
        if a.event_id == @event.id
          @b = true
        end
      end
    end
    end    
  end

  def destroy
    @desevent = Event.find(params["id"])
    if @desevent.attendances.count == 0
      @desevent.destroy
      redirect_to "/events"
    end
    redirect_to "/events"
  end


end