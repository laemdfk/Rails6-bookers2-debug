class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  #バリデーションを追加
  validates :comments,presence: ture
end
