require 'rails_helper'

feature 'home' do
  context 'home page load' do
    scenario 'should see logo,slogan, sign in and sign up' do
      visit '/'
      expect(page).to have_content 'gratis'
      expect(page).to have_link 'Sign up'
    end
  end
end
