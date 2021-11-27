class User::RelationshipEventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @user = current_user
    @relationship_event = RelationshipEvent.new

  end

  def create
    @event = Event.find(params[:event_id])
    # @user = current_user
    @relationship_event = current_user.relationship_events.new(event_id: @event.id)
    # @relationship_event = RelationshipEvent.new(event_id: @event.id, user_id: current_user.id)
    @relationship_event.save
    redirect_to event_path(@event)
  end

  # private
  # def relationship_event_params
  #   params.require(:relationship_event).permit(:event_id, :user_id)
  # end

end
