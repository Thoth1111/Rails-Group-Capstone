require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'index' do
    before(:all) do
      Capybara.reset_sessions!
    end

    before(:each) do
      visit recipes_path

      if page.current_path == new_user_session_path
        fill_in 'Email', with: users(:two).email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end

    it 'Should have a navigation menu' do
      expect(page).to have_selector('button.menu')
    end

    it 'Should have the page name heading' do
      expect(page).to have_content('Recipes')
    end

    it 'Should have a list of users recipes' do
      expect(page).to have_content(recipes(:two).name)
    end

    it 'Should have a link to remove a recipe' do
      within 'article.listed-recipe:nth-child(1)' do
        expect(page).to have_link('REMOVE')
      end
    end

    it 'Should open the recipe when clicked' do
      click_link recipes(:two).name
      expect(page).to have_current_path(recipe_path(recipes(:two)))
    end
  end
end
