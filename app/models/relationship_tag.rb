class RelationshipTag < ApplicationRecord

  belongs_to :tag
  belongs_to :event

  validates :tag_id, presence:true
  validates :event_id, presence:true
  # 同じ名前のタグを保存できないようにする
  validates :tag_name, uniqueness: true

end
