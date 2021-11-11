class User::EventsController < ApplicationController

  def index
    # @event = Event.new
    # @events = Event.all
  end

  def create
    @event = Event.new(event_parameter)
    # @event.save!
    # redirect_to events_path
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end



  private

  def event_parameter
    # params.require(:event).permit(:event_date, :event_time, :event_name, :event_content, :tag_id)

  end

end
