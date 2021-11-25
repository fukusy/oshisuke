class Tag < ApplicationRecord

  has_many :events, through: :relationship_tags
  has_many :relationship_tags, dependent: :destroy
  
  # タグ名が空じゃないことをチェック
  validates :tag_name, presence: true
  
  # 検索機能
  def self.search(keyword)
    @tags = Tag.where("tag_name LIKE ?", "%#{keyword}%")
  end


end
