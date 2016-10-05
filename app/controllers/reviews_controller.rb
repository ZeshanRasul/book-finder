class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build_with_user(review_params, current_user)

    if @review.save
      redirect_to books_path
    else
      flash[:notice] = "You have already reviewed this book"
      redirect_to books_path
      # else
      #   render :new
      # end
    end
    # redirect_to '/books'
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)

  end
end
