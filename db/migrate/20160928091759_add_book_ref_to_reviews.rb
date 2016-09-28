class AddBookRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :book, foreign_key: true
  end
end
