class Event < ApplicationRecord

  belongs_to :user
  has_many :relationship_events
  has_many :joined_users, through: :relationship_events, source: :user
  belongs_to :comment
  belongs_to :tag

end
