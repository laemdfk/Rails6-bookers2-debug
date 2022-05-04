class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  
  has_many :favorite, dependent: :destroy
  has_many :book_comment, dependent: :destroy

  has_many :follower,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :followed,class_name:"Relationship",foreign_kye:"followed_id",dependent: :destroy

  has_many :following_user,through: :follower,source:followed
  has_many :follower_user,through: :followed,source:follower
  
  
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    follower.find_by(followed_id: user_id),destroy
  end

  def following?(user)
    following_user.include?(user)
  end


  has_one_attached :profile_image


  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true


  # profile_image.variant(resize_to_limit: [width, height]).processed
end