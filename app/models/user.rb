class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :contacts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationship_events, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :joined_events, through: :relationship_events, source: :event

   # フォローの動き
  has_many :reverse_of_relationships, class_name: "RelationshipUser", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人

  has_many :relationship_users, class_name: "RelationshipUser", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
  has_many :followings, through: :relationship_users, source: :followed
  # 与フォロー関係を通じて参照→follower_idをフォローしている人

  # フォローする
  def follow(user_id)
    relationship_users.create(followed_id: user_id)
  end

  # フォローを外す
  def unfollow(user_id)
    relationship_users.find_by(followed_id: user_id).destroy
  end

  # フォローを確認する
  def following?(user)
    followings.include?(user)
  end

  attachment :profile_image


  # チェックされていなければ表示
  validates :use_rules, presence: {message: 'のチェックをしてください'}


   # Twitterログイン

    def self.find_for_oauth(auth)
      user = User.where(uid: auth.uid, provider: auth.provider).first

      user ||= User.create!(
        uid: auth.uid,
        provider: auth.provider,
        name: auth[:info][:name],
        email: User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        use_rules: true
      )


      user
    end

    private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end



end
