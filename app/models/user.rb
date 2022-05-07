class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

# いいね機能のアソシエーション
  has_many :favorite, dependent: :destroy

# コメント機能のアソシエーション
  has_many :book_comment, dependent: :destroy


# フォロー・フォロワー機能のアソシエーション

# フォローされる(被フォロー)側のアソシエーション
 has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
# 自分をフォローしているユーザーをフォロー関係を通じて参照する
 has_many :followers, through: :reverese_of_relatiobships,source: :followed

#フォローする側のアソシエーション
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
# 自分がフォローしているユーザーをフォロー関係を通じて参照する
has_many :followings, through: :elatiobships,source: :followed

# has_many :followings, through: :relationships, source: :followed
# has_many :followers, through: :relationships, source: :follower


  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end


# 名前と自己紹介のバリデーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
   validates :introduction, length: { maximum: 50 }



# 写真の表示についてのコード
  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  # profile_image.variant(resize_to_limit: [width, height]).processed

# 検索機能についての定義
 def self.search_for(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
 end
end