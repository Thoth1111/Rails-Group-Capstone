require 'rails_helper'

RSpec.describe Food, type: :system do
  describe 'index' do
    before(:all) do
      Capybara.reset_sessions!
    end

    before(:each) do
      visit foods_path

      if page.current_path == new_user_session_path
        fill_in 'Email', with: users(:one).email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end

    it 'should have a title' do
      expect(page).to have_content('Foods')
    end

    it 'should have a link to create a new food' do
      expect(page).to have_link('Add Food', href: new_food_path)
    end

    it 'should have table headers' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Measurement Unit')
      expect(page).to have_content('Unit Price')
      expect(page).to have_content('Actions')
    end
  end
end
