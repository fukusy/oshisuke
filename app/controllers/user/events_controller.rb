class User::EventsController < ApplicationController

  def index
    @event = Event.new
    @tags = Tag.all
    @events = Event.all
  end

  def create
    @event = Event.new(event_parameter)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(event.id)
    else
      render :index
    end
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
    params.require(:event).permit(:event_date, :event_time, :event_name, :event_content)

  end

end
