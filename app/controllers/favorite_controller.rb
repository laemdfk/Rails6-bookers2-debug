class FavoriteController < ApplicationController
  def create
  book = Book.find(params[:book_id])
  favorite = current_user.favorites.new(book_id: book.id)
  favorite.save
  redirect_to book_path(book)
    # @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])

    # @book_favorite.save?
    # redirect_to back
     #request.referer=特定の処理後、遷移元のURLに戻る（リダイレクトする）ための処理。
  end

  def destroy
    book = Book.find(params[:book_id])
  favorite = current_user.favorites.find_by(book_id: book.id)
  favorite.destroy
  redirect_to book_path(book)
    # @book_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])

    # @book_favorite.destroy
    # redirect_to back
  end
end
