class User::TagsController < ApplicationController

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag_events = @tag.relationship_tag.events.page(params[:page]).reverse_order
  end

end
