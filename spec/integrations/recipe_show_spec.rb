require 'rails_helper'

RSpec.describe Recipe, type: :feature do
  before(:all) do
    Capybara.reset_sessions!
  end

  before(:each) do
    visit recipe_path(recipes(:two).id)

    if page.current_path == new_user_session_path
      fill_in 'Email', with: users(:two).email
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end
  end

  it 'Should have a navigation menu' do
    expect(page).to have_selector('button.menu')
  end

  it 'Should have the recipe name heading' do
    expect(page).to have_content(recipes(:two).name)
  end

  it 'Should have the recipe description' do
    expect(page).to have_content(recipes(:two).description)
  end

  it 'Should have the recipe preparation time' do
    expect(page).to have_content(recipes(:two).preparation_time)
  end

  it 'Should have the recipe cooking time' do
    expect(page).to have_content(recipes(:two).cooking_time)
  end

  it 'Should have a back-to-recipes link' do
    expect(page).to have_link('Back to recipes')
  end

  it 'Should have a table of ingredients' do
    expect(page).to have_selector('table')
  end

  it 'Should display the recipe_foods associated with the recipe' do
    expect(page).to have_content(recipe_foods(:two).food.name)
    expect(page).to have_content(recipe_foods(:two).quantity)
    expect(page).to have_content(recipe_foods(:two).food.price)
  end

  it 'Should have a link back to the recipes page' do
    expect(page).to have_link('Back to recipes')
  end

  it 'Should have Add-Ingredient button' do
    expect(page).to have_link('Add Ingredient')
  end

  it 'Should have Generate-Shopping-list button' do
    expect(page).to have_link('Generate shopping list')
  end

  it 'Should have a link to Modify a recipe_food' do
    expect(page).to have_link('Modify')
  end

  it 'Should have a link to Remove a recipe_food' do
    expect(page).to have_link('Remove')
  end

  it 'Should redirect to the recipe_food#new page when Add Ingredient is clicked' do
    click_link('Add Ingredient')
    expect(page.current_path).to eq(new_recipe_food_path(recipes(:two)))
  end

  it 'Should redirect to the recipe_food#edit page when Modify is clicked' do
    click_link('Modify')
    expect(page.current_path).to eq(recipe_path(recipe_foods(:two)))
  end

  it 'Should update the destruction of a recipe_food when Remove is clicked' do
    click_link('Remove')
    expect(page).to have_content('Recipe food was successfully destroyed.')
  end
end
