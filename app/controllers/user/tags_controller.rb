class User::TagsController < ApplicationController
  
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag_items = @tag.items.page(params[:page]).reverse_order
  end
  
end
