class User::CommentsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    event = Event.find(params[:event_id])
    comment = current_user.comments.new(comment_params)
    comment.event_id = event.id
    comment.save!
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:event_id])
    event = Event.find(params[:event_id])
    @comment = Comment.find_by(id: params[:id])

  end

  def update
    comment = Comment.find_by(id: params[:id])
    event = Event.find(params[:event_id])
    comment.update(comment_update_params)
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Comment.find_by(id: params[:id],event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :event_id, :user_id)
  end

  def comment_update_params
    params.require(:comment).permit(:comment_content)
  end

end
