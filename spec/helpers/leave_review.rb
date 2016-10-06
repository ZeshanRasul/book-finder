def leave_review(thoughts, rating)
  visit '/books'
  click_link 'Review Angels and Demons'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
