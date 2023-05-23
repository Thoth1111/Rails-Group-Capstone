user = User.create(
  name: 'Admin',
  email: 'admin@gmail.com',
  password: 'password'
)

apple = Food.create(
  name: 'Apple',
  measurement_unit: 'grams',
  price: 5,
  quantity: 100,
  user_id: user.id
)

pineapple = Food.create(
  name: 'Pineapple',
  measurement_unit: 'grams',
  price: 1,
  quantity: 100,
  user_id: user.id
)

chicken_breast = Food.create(
  name: 'Chicken Breast',
  measurement_unit: 'units',
  price: 10,
  quantity: 10,
  user_id: user.id
)

simple_dish = Recipe.create(
  name: 'Simple Dish',
  preparation_time: '10 minutes',
  cooking_time: '10 minutes',
  description: 'A simple dish',
  public: true,
  user_id: 1
)

too_much = Recipe.create(
  name: 'Too Much',
  preparation_time: '10 minutes',
  cooking_time: '10 minutes',
  description: 'A complex dish',
  public: true,
  user_id: user.id
)

high_roller = Recipe.create(
  name: 'High Roller',
  preparation_time: '10 minutes',
  cooking_time: '10 minutes',
  description: 'A complex dish',
  public: true,
  user_id: user.id
)

recipe_food1 = RecipeFood.create(
  quantity: 100,
  recipe_id: simple_dish.id,
  food_id: apple.id
)

recipe_food2 = RecipeFood.create(
  quantity: 100,
  recipe_id: simple_dish.id,
  food_id: pineapple.id
)

recipe_food3 = RecipeFood.create(
  quantity: 100,
  recipe_id: simple_dish.id,
  food_id: chicken_breast.id
)

recipe_food4 = RecipeFood.create(
  quantity: 100,
  recipe_id: too_much.id,
  food_id: apple.id
)

recipe_food5 = RecipeFood.create(
  quantity: 100,
  recipe_id: too_much.id,
  food_id: pineapple.id
)

recipe_food6 = RecipeFood.create(
  quantity: 100,
  recipe_id: high_roller.id,
  food_id: apple.id
)

recipe_food7 = RecipeFood.create(
  quantity: 100,
  recipe_id: high_roller.id,
  food_id: chicken_breast.id
)
