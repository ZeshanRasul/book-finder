require 'rails_helper'

feature 'reviewing' do
  before do
    Book.create(name: "Angels and Demons", author: "Dan Brown")
    sign_up
  end

  scenario 'allows users to leave a review using a form' do
    visit '/books'
    click_link 'Review Angels and Demons'
    fill_in "Thoughts", with: "Thrilling"
    select '5', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/books'
    expect(page).to have_content('Thrilling')
  end

  scenario 'prevents user from leaving two reviews' do
    visit '/books'
    click_link 'Review Angels and Demons'
    fill_in "Thoughts", with: "Thrilling"
    select '5', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Review Angels and Demons'
    fill_in "Thoughts", with: "Not so great"
    select '1', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/books'
    expect(page).to have_content('You have already reviewed this book')
  end
end
