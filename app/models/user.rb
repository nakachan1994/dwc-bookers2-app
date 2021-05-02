class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  # ユーザーとフォローする人、される人を関連付け
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォローしてる人、されてる人の一覧
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_id, through: :followed, source: :follower

  attachment :profile_image

  validates :name,presence:true, uniqueness:true, length:{minimum:2,maximum:20}
  validates :introduction, length:{maximum:50}

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  # フォローしているか確認
  def following?(user)
    following_user.include?(user)
  end
end
