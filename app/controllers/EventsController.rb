class EventsController < ApplicationController
	def index
		puts "***************************************************"
		@event = Event.all
	end

	def new
	end

	def create
		@event = Event.new(title: params["title"], decription: params["decription"], price: params["price"], location: params["location"])

    	if @gossip.save
    		redirect_to "/gossips"
  		else
  			redirect_to "/gossips/new"
  		end
	end

end