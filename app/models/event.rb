class Event < ApplicationRecord

  belongs_to :user
  has_many :relationship_events
  has_many :joined_users, through: :relationship_events, source: :user
  has_many :comment, dependent: :destroy

  has_many :tags, through: :relationship_tags
  has_many :relationship_tags, dependent: :destroy

  def start_time
    self.event_date
  end


  # def save_tags(genres)
  #   current_genres = self.tags.pluck(:name) unless self.tags.nill?
  #   old_genres = current_genres - genres
  #   new_genres = genres - current_genres

  #   # 古いタグをeventから削除
  #   old_genres.each do |old_name|
  #     self.tags.delete Tag.find_by(name:old_name)
  #   end

  #   # 新しいタグをeventに追加
  #   new_genres.each do |new_name|
  #     relationship_tag = Tag.find_or_create_by(name:new_name)
  #     self.tags << relationship_tag
  #   end

  # end



end
