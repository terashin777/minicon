class Admin::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  
  layout 'admin'
  
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
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
    @event.update(event_params)
    redirect_to admin_event_path(@event), notice: "Event was successfully updated!"
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
  
end
