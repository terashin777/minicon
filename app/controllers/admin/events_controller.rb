class Admin::EventsController < ApplicationController
  layout 'admin'
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def create
    event = Event.new(event_params)
    event.save
    redirect_to admin_event_path(event), notice: "Event was successfully created!"
  end
  
  def destroy
    Event.destroy(params[:id])
    redirect_to admin_events_path, notice: "Event was successfully destroyed!"
  end
  
  def update
    Event.update(event_params)
    redirect_to admin_events_path, notice: "Event was successfully updated!"
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
  end
  
end
