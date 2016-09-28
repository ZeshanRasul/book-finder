class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if !@book.save
      flash[:notice] = 'Error, Name too short'
      redirect_to '/books'
    else
      redirect_to '/books'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to '/books'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book deleted successfully'
    redirect_to '/books'
  end

  def book_params
    params.require(:book).permit(:name, :author, :year, :genre, :description)
  end
end
