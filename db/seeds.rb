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
