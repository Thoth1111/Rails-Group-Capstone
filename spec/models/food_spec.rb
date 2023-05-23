require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it 'should belong to a user' do
      food = Food.reflect_on_association(:user)
      expect(food.macro).to eq(:belongs_to)
    end

    it 'should have many recipe_foods' do
      food = Food.reflect_on_association(:recipe_foods)
      expect(food.macro).to eq(:has_many)
    end
  end
end
