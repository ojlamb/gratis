require 'rails_helper'

feature 'search engine' do
  before(:each) do
    user = create(:user)
    sign_in_as(user)
  end
  context 'new search' do
    scenario 'should see categories and location box and search box' do
      visit '/search'
      expect(page).to have_content 'select activity'
      expect(page).to have_link 'Get Free'
    end
  end
end
