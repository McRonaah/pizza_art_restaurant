# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all
10.times do
    Restaurant.create(name:Faker::Restaurant.name, address:Faker::Address.full_address)
end
10.times do
    Pizza.create(
        name:Faker::Food.ingredient,
        ingredients: [Faker::Food.ingredient, Faker::Food.ingredient, Faker::Food.ingredient],
    )
end
10.times do
    RestaurantPizza.create(
        restaurant_id: Restaurant.all.sample.id,
        pizza_id: Pizza.all.sample.id
    )
end