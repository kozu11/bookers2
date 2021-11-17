class BooksController < ApplicationController
  def create
    book = Book.new(books_params)
    book.user_id = current_user.id
    book.save
    redirect_to books_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def books_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
