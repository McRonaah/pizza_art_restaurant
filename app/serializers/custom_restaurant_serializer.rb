class CustomRestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :pizzas
end
