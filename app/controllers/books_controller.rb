class BooksController < ApplicationController
  def create
  end
  
  def index
    @book = Book.new
    @user = User.find[:id]
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
