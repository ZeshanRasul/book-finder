require 'rails_helper'

feature 'books' do
  context 'no books have been added' do
    scenario 'should display a prompt to add books' do
      visit '/books'
      expect(page).to have_content 'No books'
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
      expect(page).not_to have_content 'No books'
    end
  end

  context 'adding new books' do
    scenario 'prompts user to complete form and then displays new book' do
      sign_up
      visit '/books'
      click_link 'Click here to add a book'
      fill_in 'Name', with: 'Blink'
      fill_in 'Author', with: 'Malcolm Gladwell'
      fill_in 'Year', with: 2005
      fill_in 'Genre', with: 'Non-Fiction'
      fill_in 'Description', with: 'A book about thinking without thinking'
      click_button 'Create Book'
      expect(page).to have_content 'Blink'
      expect(page).not_to have_content 'No books'
    end

    scenario 'multiple books with the same name cannot be added' do
      sign_up
      visit '/books'
      click_link 'Click here to add a book'
      fill_in 'Name', with: 'Blink'
      fill_in 'Author', with: 'Malcolm Gladwell'
      fill_in 'Year', with: 2005
      fill_in 'Genre', with: 'Non-Fiction'
      fill_in 'Description', with: 'A book about thinking without thinking'
      click_button 'Create Book'
      click_link 'Click here to add a book'
      fill_in 'Name', with: 'Blink'
      fill_in 'Author', with: 'Malcolm Gladwell'
      fill_in 'Year', with: 2005
      fill_in 'Genre', with: 'Non-Fiction'
      fill_in 'Description', with: 'A book about thinking without thinking'
      click_button 'Create Book'
      expect(page).to have_content 'Error'
    end

    context 'invalid book' do
      scenario 'cant submit a name too short' do
        sign_up
        visit '/books'
        click_link 'Click here to add a book'
        fill_in 'Name', with: '£'
        click_button 'Create Book'
        expect(page).not_to have_content '£'
        expect(page).to have_content 'Error'
      end
    end

    scenario 'books cannot be submitted if user is not logged in' do
      visit '/books'
      click_link 'Click here to add a book'
      expect(page).to have_content 'Log in'
      expect(page).not_to have_content 'Create Book'
    end
  end

  context 'viewing books' do
    let!(:sapiens){ Book.create(name: "Sapiens", author: "Yuval Noah Harari", year: 2011, genre: "Non-Fiction", description: "A book about the history of the homo sapien race")}
    scenario 'should display individual book when link is clicked' do
      visit '/books'
      click_link 'Sapiens'
      expect(page).to have_content 'Sapiens'
      expect(page).to have_content 'A book about the history of the homo sapien race'
      expect(current_path).to eq "/books/#{sapiens.id}"
    end
  end

  context 'editing books' do

    before do
      Book.create(name: "Great Gatsby", author: "FSF")
    end

    scenario 'allows user to edit book' do
      sign_up
      visit '/books'
      click_link 'Edit Great Gatsby'
      fill_in 'Name', with: 'The Great Gatsby'
      fill_in 'Author', with: 'F.Scott Fitzgerald'
      fill_in 'Year', with: 1925
      click_button 'Update Book'
      expect(page).to have_content 'The Great Gatsby'
      expect(page).to have_content 'F.Scott Fitzgerald'
      expect(page).to have_content 1925
      expect(current_path).to eq '/books'
    end

  end

  context 'deleting books' do
    before do
      Book.create(name: "Great Gatsby", author: "FSF")
    end
    scenario 'allows user to delete a book' do
      sign_up
      visit '/books'
      click_link 'Delete Great Gatsby'
      expect(page).not_to have_content 'Great Gatsby'
      expect(page).to have_content 'Book deleted successfully'
      expect(current_path).to eq '/books'
    end
  end

  context 'searching books' do
    before do
      sign_up
      Book.create(name: "The Lord of The Rings")
      Book.create(name: "The Hobbit")
    end
    scenario 'user can search a book and only valid results will display' do
      visit '/books'
      fill_in 'Search', with: "The Hobbit"
      click_button 'Search'
      expect(page).to have_content "The Hobbit"
      expect(page).not_to have_content "The Lord of The Rings"
      expect(current_path).to eq '/books'
    end
  end
end
