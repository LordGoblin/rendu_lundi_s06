class ParticipationsController < ApplicationController
  def new
    @event = Event.find(params["event_id"])
  end

  def create
    @attendance = Attendance.new(user_id: current_user.id, event_id: params["event_id"])
    if @attendance.save
      redirect_to "/events"
    else
      render :new
    end
  end

  def show
    @event = Event.find(params["id"])
  end
end