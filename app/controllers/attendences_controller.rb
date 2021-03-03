class AttendencesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if event.attendees.exists?(current_user.id)
      redirect_to root_path, notice: 'You already attended this event'
    else
      event.attendees << current_user
      redirect_to root_path, notice: 'Added to you events'
    end
  end
end
