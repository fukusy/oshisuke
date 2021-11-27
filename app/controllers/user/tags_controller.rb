class User::TagsController < ApplicationController

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag_events = @tag.relationship_tags
  end

end
