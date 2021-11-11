class Event < ApplicationRecord
  
  belongs_to :user
  belongs_to :relationship_event
  belongs_to :comment
  belongs_to :tag
  
end
