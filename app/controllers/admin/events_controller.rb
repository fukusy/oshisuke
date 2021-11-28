class Admin::EventsController < ApplicationController

  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
    @tags = Tag.all
    gon.tags = @tags

  end

  def update
    @event = Event.find(params[:id])
    @tags = Tag.all
    gon.tags = @tags
    @event.update(event_params)
    redirect_to admin_events_path(@event)
  end



  private

  def event_params
    params.require(:event).permit(:event_date, :event_time, :event_name, :event_content, tag_ids:[] )

  end

end
