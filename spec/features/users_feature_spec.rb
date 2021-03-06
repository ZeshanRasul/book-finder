require 'rails_helper'

  feature 'user can sign in and out' do

    context 'user can sign in and out' do
        it "should see a 'sign in' link and a 'sign up' link" do
          visit '/'
          expect(page).to have_link('Sign in')
          expect(page).to have_link('Sign up')
        end

        it "should not see 'sign out' link" do
          visit '/'
          expect(page).not_to have_link('Sign out')
        end
    end

    context 'user signed in on the home' do
      before do
        visit '/'
        click_link 'Sign up'
        fill_in 'Email', with: 'test@example.com'
        fill_in 'Password', with: 'testtest'
        fill_in 'Password confirmation', with: 'testtest'
        click_button 'Sign up'
      end

      it "should see 'sign out' link" do
        visit ('/')
        expect(page).to have_link('Sign out')
      end

      it "should not see a 'Sign up' or 'Sign in' link" do
        visit ('/')
        expect(page).not_to have_link('Sign up')
        expect(page).not_to have_link('Sign in')
      end  
    end

  end
