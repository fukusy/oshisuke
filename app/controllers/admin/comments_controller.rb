class Admin::CommentsController < ApplicationController

  def destroy
    Comment.find_by(id: params[:id],event_id: params[:event_id]).destroy
    redirect_to admin_event_path(params[:event_id])
  end

end
