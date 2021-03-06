require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "can sign up with a photo" do
      visit('/')
      click_link('Sign up')
      fill_in('Name', with: 'Harry')
      fill_in('Email', with: 'test@example.com')
      fill_in(:user_password, with: 'testtest')
      fill_in(:user_password_confirmation, with: 'testtest')
      allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/spec/asset_specs/photos/Pirate-Parrot.jpg")
      click_button('Sign up')
      expect(page).to have_css('img[src*="Pirate-Parrot.jpg"]')
    end
  end

  context "user signed in on the homepage" do
    before do
		visit('/')
        click_link('Sign up')
        fill_in('Name', with: 'Harry')
        fill_in('Email', with: 'test@example.com')
        fill_in(:user_password, with: 'testtest')
        fill_in(:user_password_confirmation, with: 'testtest')
        click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
