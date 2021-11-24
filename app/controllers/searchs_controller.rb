class SearchsController < ApplicationController
  
  def search
    @events = Event.search(params[:keyword])
    @keyword = params[:keyword]
  end
  
end
