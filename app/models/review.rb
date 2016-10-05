class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, inclusion: (1..5)
  validates :user, uniqueness: { scope: :book, message: "has reviewed this book already" }
end
