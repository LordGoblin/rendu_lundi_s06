class ParticipationsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  def new
    #if Attendance.where(user: current_user.id.to_s)
    #  redirect_to "/events"
    #end
    @event = Event.find(params["event_id"])
  end

  def create
        # Amount in cents
    @event = Event.find(params["event_id"])

    @amount = @event.price * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    puts "****************************"
    puts params
    @attendance = Attendance.new(user_id: current_user.id, event_id: params["event_id"], stripe_customer_id: params["stripeToken"])
    if @attendance.save
      redirect_to "/events"
    else
      render :new
    end
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  def show
    @event = Event.find(params["id"])
  end
end