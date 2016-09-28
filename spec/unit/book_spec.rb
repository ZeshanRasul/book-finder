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
