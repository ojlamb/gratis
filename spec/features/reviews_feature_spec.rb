require 'rails_helper'

feature 'reviewing' do
  before {Event.create name: 'Yoga'}

  scenario 'allows users to leave a review using a form' do
     visit '/events'
     click_link 'Review Yoga'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'

     expect(current_path).to eq '/events'
     expect(page).to have_content('so so')
  end

end
