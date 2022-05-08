class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    # @book_comments = Comment.all
    @book_comment =  BookComment.new
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    # @book = Book.find(params[:id])
  end

def create
		@book = Book.new(book_params)

        @book.user_id = current_user.id
        #↑ ユーザーと投稿を紐づけるためのコード

	    if @book.save
        flash[:notice] = "You have creatad book successfully."
		    redirect_to  book_path(@book.id)

       else
        @books = Book.all
        render "index"
      end
	 end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   private

    def book_params
        params.require(:book).permit(:title, :body, :book_id)
    end
    
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end