class SearchsController < ApplicationController

  def search
    @keyword = params[:keyword]
    #@events = Event.search(params[:keyword])
    event1 = Event.search(params[:keyword])
    # tag_id = Tag.search(params[:keyword])
    # event2 = Event.first.relationship_tags.where(tag_id: tag_id)
    event2 = Event.joins(:tags).where("tags.tag_name LIKE ?", "%#{@keyword}%")
    @events = event1 + event2 #hairetu ketugou
    @events.uniq

  end

end
