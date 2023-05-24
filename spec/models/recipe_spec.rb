require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'should validate presence of name' do
      recipe = Recipe.new(name: '')
      expect(recipe.valid?).to be false
      expect(recipe.errors[:name]).to include("can't be blank")
    end
    it 'should validate presence of description' do
      recipe = Recipe.new(description: '')
      expect(recipe.valid?).to be false
      expect(recipe.errors[:description]).to include("can't be blank")
    end
    it 'should validate presence of preparation_time' do
      recipe = Recipe.new(preparation_time: '')
      expect(recipe.valid?).to be false
      expect(recipe.errors[:preparation_time]).to include("can't be blank")
    end
    it 'should validate inclusion of public' do
      recipe = Recipe.new(public: '')
      expect(recipe.valid?).to be false
      expect(recipe.errors[:public]).to include('is not included in the list')
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      recipe = Recipe.reflect_on_association(:user)
      expect(recipe.macro).to eq(:belongs_to)
    end
  end
end
