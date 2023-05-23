require 'rails_helper'

RSpec.describe Recipe, type: :system do
  describe 'public recipes' do
    before(:all) do
      Capybara.reset_sessions!
    end

    before(:each) do
      visit public_recipes_path

      if page.current_path == new_user_session_path
        fill_in 'Email', with: users(:one).email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end

    it 'should have a title' do
      expect(page).to have_content('Public Recipes')
    end

    it 'should go to the recipe show page when clicking on a recipe' do
      recipes.each do |recipe|
        expect(page).to have_link(recipe.name, href: recipe_path(recipe))
      end
    end

    it 'should show informations' do
      recipes.each do |recipe|
        expect(page).to have_content(recipe.name)
        expect(page).to have_content(recipe.foods.count)
        expect(page).to have_content(recipe.user.name)
      end
    end
  end
end
