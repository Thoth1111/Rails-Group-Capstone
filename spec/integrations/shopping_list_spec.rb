require 'rails_helper'

RSpec.describe Food, type: :system do
  describe 'Shopping List' do
    before(:all) do
      Capybara.reset_sessions!
    end

    before(:each) do
      visit general_shopping_list_path

      if page.current_path == new_user_session_path
        fill_in 'Email', with: users(:one).email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end

    it 'should have a title' do
      expect(page).to have_content('Shopping List')
    end

    it 'should have table headers' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Price')
    end

    it 'should display amount and total' do
      expect(page).to have_content('Amount')
      expect(page).to have_content('Total')
    end
  end
end
