class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    
    comment.save
    redirect_to request.referer
    
  # book = Book.find(params[:book_id])
  # book_comment = current_user.book_comments.new(book_comment_params)
  # book_comment.save
  # redirect_to request.referer
     #request.referer=特定の処理後、遷移元のURLに戻る（リダイレクトする）ための処理。
  end

  def destroy
    BookComment.find(params[:id])
    redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:book_comment)
  end
end
