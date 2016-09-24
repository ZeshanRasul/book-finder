require 'rails_helper'

feature 'books' do
  context 'no books have been added' do
    scenario 'should display a prompt to add books' do
      visit '/books'
      expect(page).to have_content 'No books yet'
      expect(page).to have_button 'Click here to add a book'
    end
  end
end
