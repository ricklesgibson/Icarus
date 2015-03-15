class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.where(user_id:current_user.id)
  end

  def new
    @event = Event.new
    @user = current_user
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
  end

  def create
    
    event = current_user.events.new(event_params)

      if event.save
    
      redirect_to event_path(event)
    else 
      redirect_to new_events_path
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

private
 def set_user
      @user = User.find(params[:id])
  end
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event, :start_time, :end_time, :location, :user_id, :city, :state, :zip)
    end
end
