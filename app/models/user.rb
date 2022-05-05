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
  has_many :follower,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :followed,class_name:"Relationship",foreign_key:"followed_id",dependent: :destroy

  has_many :following_user,through: :follower,source:followed
  has_many :follower_user,through: :followed,source:follower


  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end


# 名前のバリデーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

# 写真の表示についてのコード
  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  # profile_image.variant(resize_to_limit: [width, height]).processed
end