require 'rails_helper'

feature 'books' do
  context 'no books have been added' do
    scenario 'should display a prompt to add books' do
      visit '/books'
      expect(page).to have_content 'No books yet'
      expect(page).to have_button 'Click here to add a book'
    end
  end

  context 'books have been added' do
    before do
      Book.create(name: 'The Prince')
    end

    scenario 'should display a book' do
      visit '/books'
      expect(page).to have_content 'The Prince'
      expect(page).not_to have_content 'No books yet'
    end
  end

  context 'adding new books' do
    scenario 'prompts user to complete form and then displays new book' do
      visit '/books'
      click_link 'Click here to add a book'
      fill_in 'Name', with: 'Blink'
      fill_in 'Author', with: 'Malcolm Gladwell'
      fill_in 'Year', with: 2005
      fill_in 'Genre', with: 'Non-Fiction'
      click_button 'Create Book'
      expect(page).to have_content 'Blink'
      expect(page).not_to have_content 'No books yet'
    end
  end

  context 'viewing books' do
    let!(:sapiens){ Book.create(name: "Sapiens", author: "Yuval Noah Harari", year: 2011, genre: "Non-Fiction")}
    scenario 'should display individual book when link is clicked' do
      visit '/books'
      click_link 'Sapiens'
      expect(page).to have_content 'Sapiens'
      expect(current_path).to eq "/books/#{sapiens.id}"
    end
  end
end
