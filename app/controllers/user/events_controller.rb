class User::EventsController < ApplicationController

  def index
  end
  
  def create
    @event = Event.new(event_parameter)
  end
  
  def show
  end
  
  def destroy
  end
  
  def edit
  end
  
  def update
  end
  
  
  
  private
  
  def event_parameter
    
  end

end
