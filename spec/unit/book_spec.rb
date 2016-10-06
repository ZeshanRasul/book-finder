require 'rails_helper'

describe 'book' do
  it 'can not be valid unless over 2 characters' do
    book = Book.create(name: '£')
    expect(book).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Book.create(name: "The Bible")
    book = Book.new(name: "The Bible")
    expect(book).not_to be_valid
  end
end

describe 'average rating' do
  context 'no reviews' do
    it "returns 'N/A' when there are no reviews" do
      book = Book.create(name: "Great Expectations")
      expect(book.average_rating).to eq 'N/A'
    end
  end

  context 'one review' do
    it 'returns that review' do
      book = Book.create(name: "Great Expectations")
      book.reviews.create(rating: 5)
      expect(book.average_rating).to eq 5
    end
  end

  context 'multiple reviews' do
    it 'returns the average of reviews' do
      book = Book.create(name: "Great Expectations")
      book.reviews.create(rating: 5)
      book.reviews.create(rating: 1)
      expect(book.average_rating).to eq 3
    end
  end
end
