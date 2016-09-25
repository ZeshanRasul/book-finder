class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :author, :year, :genre)
  end
end
