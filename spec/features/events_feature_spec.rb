require 'rails_helper'

feature 'events' do
  context 'no events have been added' do
    scenario 'should display a prompt to add an event' do
      visit '/events'
      expect(page).to have_content 'No events yet'
      expect(page).to have_link 'Add an Event'
    end
  end

  context 'events have been added' do
    before do
      Event.create(name: 'Yoga')
    end

    scenario 'display events' do
      visit '/events'
      expect(page).to have_content('Yoga')
      expect(page).not_to have_content('No events yet')
    end
  end

  context 'creating events' do
    scenario 'prompts user to fill out a form, then displays the new event' do
      visit '/events'
      click_link 'Add an Event'
      fill_in 'Name', with: 'Yoga'
      click_button 'Create Event'
      expect(page).to have_content 'Yoga'
      expect(current_path).to eq '/events'
    end
  end

  context 'viewing events' do

    let!(:yoga){Event.create(name:'Yoga')}

    scenario 'lets a user view an event' do
     visit '/events'
     click_link 'Yoga'
     expect(page).to have_content 'Yoga'
     expect(current_path).to eq "/events/#{yoga.id}"
    end
  end

  context 'editing events' do
    let!(:yoga){Event.create(name:'Yoga')}

    scenario 'let a user edit an event' do
     visit '/events'
     click_link 'Edit Yoga'
     fill_in 'Name', with: 'Hot Yoga'
     click_button 'Update Event'
     expect(page).to have_content 'Hot Yoga'
     expect(current_path).to eq '/events'
    end
  end

  context 'deleting events' do
    before {Event.create name: 'Yoga'}

    scenario 'removes a event when a user clicks a delete link' do
      visit '/events'
      click_link 'Delete Yoga'
      expect(page).not_to have_content 'Yoga'
      expect(page).to have_content 'Event Deleted Successfully'
    end
  end

end
