require 'rails_helper'

feature 'books' do
  context 'no books have been added' do
    scenario 'should display a prompt to add books' do
      visit '/books'
      expect(page).to have_content 'No books yet'
      expect(page).to have_button 'Click here to add a book'
    end
  end

  context 'restaurants have been added' do
    before do
      Book.create(name: 'The Prince')
    end

    scenario 'should display a book' do
      visit '/books'
      expect(page).to have_content 'The Prince'
      expect(page).not_to have_content 'No books yet'
    end

  end
end
