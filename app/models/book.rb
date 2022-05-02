class Book < ApplicationRecord
  belongs_to :user
  has_many :favorite, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  def favorite?(user)
    favorite.where(user_id: user.id).exists?
  end
  
end
