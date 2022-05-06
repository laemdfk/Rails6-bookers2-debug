class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  #バリデーションを追加
  validates :comments,presence: true
end
