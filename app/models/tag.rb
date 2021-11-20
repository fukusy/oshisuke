class Tag < ApplicationRecord

  has_many :events, through: :relationship_tags
  has_many :relationship_tags, dependent: :destroy
  
  # タグ名が空じゃないことをチェック
  validates :tag_name, presence: true


end
