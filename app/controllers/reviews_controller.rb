class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @book.reviews.create(review_params)
    redirect_to '/books'
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
