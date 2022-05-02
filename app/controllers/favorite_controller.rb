class FavoriteController < ApplicationController
  def create
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])

    @book_favorite.save?
     redirect_to request.referer :back
     #request.referer=特定の処理後、遷移元のURLに戻る（リダイレクトする）ための処理。
  end

  def destroy
    @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])

    @book_favorite.destroy
     redirect_to request.referer :back
  end
end
