require 'rails_helper'

describe Review, type: :model do
  it 'is invalid if the rating is more than 5' do
    review = Review.new(rating: 100)
    expect(review).not_to be_valid
  end
end
