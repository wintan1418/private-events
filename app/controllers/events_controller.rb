class EventsController < ApplicationController
   def index
     @events = Event.all
   end

   def new
     @event = Event.new
   end

   def create
     @event = current_user.events.build(event_params)
     if @event.save
       redirect_to events_path, notice: "Event created successfully!"
     else
       flash.now.alert = "Invalid Event!"
       render :new
     end
   end

   def show
     @events = Event.find_by(id: event_path.last)
   end

   private

   def event_params
     params.require(:event).permit(:description)
   end
end
