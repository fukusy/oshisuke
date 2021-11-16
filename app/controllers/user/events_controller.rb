class User::EventsController < ApplicationController

  def index
    @event = Event.new
    # @event.relationship_tags.build
    @tags = Tag.all
    @events = Event.all
    gon.tags = @tags
  end

  def create
    # byebug
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    # relationship_tag = @event.tag_ids.new(tag_params)
    # relationship_tag.save!

    if @event.save!
      redirect_to event_path(@event)
    else
      render :index
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def update
  end



  private

  def event_params
    params.require(:event).permit(:event_date, :event_time, :event_name, :event_content, tag_ids:[] )

  end

  # def tag_params
    # params.require(:relationship_tag).permit(:tag_ids: tag_ids: [],:event_id: current_event)

  # end

end
