class BookCommentsController < ApplicationController
  def create
   book = Book.find(params[:book_id])
   book_comment = current_user.book_comments.new(book_comment_params)
   book_comment.save
   redirect_to request.referer
    # @book_favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])

    # @book_favorite.save?
    # redirect_to back
     #request.referer=特定の処理後、遷移元のURLに戻る（リダイレクトする）ための処理。
  end

  def destroy
    BookComment.find(params[:id])
    redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
