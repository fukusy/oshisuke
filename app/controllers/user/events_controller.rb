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
#    relationship_tag = @event.tag_ids.new(tag_params)
#    relationship_tag.save!

    if @event.save!
      if params[:event][:tag_ids].present?
        params[:event][:tag_ids].split(',').each do |tag|
          RelationshipTag.create(tag_id: tag.to_i, event: @event)
        end
      end
      redirect_to event_path(@event)
    else
      render :index
    end
  end

  def show
    @event = Event.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
    @event_tags = @event.relationship_tags
    @relation_tag_array = RelationshipTag.where(event_id: @event.id).pluck(:tag_id)

    # 後でイベント作成者とイベント参加者、それ以外をif文で分岐
    if current_user == @event.user || current_user.joined_events.include?(@event)
    # if current_user == @event.user || @event_relationship != []
      render :show
    else
      redirect_to event_relationship_event_path(@event)
    end
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
    redirect_to event_path(@event)
  end



  private

  def event_params
    params.require(:event).permit(:event_date, :event_time, :event_name, :event_content, tag_ids:[] )

  end

  # def tag_params
  #   params.require(:relationship_tag).permit(:tag_ids: tag_ids: [],:event_id: current_event)

  # end

end
